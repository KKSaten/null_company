const undoData = [];
const canvas = document.getElementById("signature-pad");
const signaturePad = new SignaturePad(canvas, {
	dotSize: 2,
	minWidth: 2,
	maxWidth: 4,
	penColor: "rgb(43, 43, 43)",
	backgroundColor: 'rgb(248,248,248)'
});

// 지우기, 되돌리기 이벤트 리스너
$("button[data-action]").on("click", function() {
	const action = $(this).data("action");
	if (action === "clear") {
		signaturePad.clear();
	} else if (action === "undo") {
		const data = signaturePad.toData();
		if (data && data.length > 0) {
			const removed = data.pop();
			undoData.push(removed);
			signaturePad.fromData(data);
		}
	}
});

// 서명 목록 비동기로 가져오기
function updateSignList() {
	fetch('/approval/signaturePad/list')
		.then(response => response.json())
		.then(signList => {
			const tableBody = document.querySelector('.signListTable tbody');
			tableBody.innerHTML = ''; // 기존 내용 초기화

			if (signList.length === 0) {
				tableBody.innerHTML = '<tr><td colspan="3" style="color:#666; font-size: 18px; text-align:center;">저장한 서명이 없습니다.</td></tr>';
			} else {
				signList.forEach(sign => {
					const row = document.createElement('tr');
					row.innerHTML = `
						<td style="width: 5%;" class="selectSignTd">
							${sign.signDefault === 'y'
							? `<input type="radio" name="selectSignRadioButton" data-sign-num="${sign.signNum}" data-sign-image-path="/file/signature/${sign.signImage}" class="selectSignRadio" checked>`
							: `<input type="radio" name="selectSignRadioButton" data-sign-num="${sign.signNum}" data-sign-image-path="/file/signature/${sign.signImage}" class="selectSignRadio">`}
						</td>
                        <td style="width: 30%;">
                            <div style="padding: 15px; border: 1px solid #ccc; display: inline-block;">
                                <img src="/file/signature/${sign.signImage}" class="signImage">
                            </div>
                        </td>
                        <td style="text-align: left; width: 25%;">
                            <div style="font-size: 18px; font-weight: 600;" class="signTitleValue">${sign.signTitle}</div>
                            <div>${sign.signDate}</div>
                        </td>
                        <td style="text-align: right !important; width: 40%;">
                            ${sign.signDefault === 'y'
							? `<button class="btn btn-border btn-success ms-2" style="background-color: #fff !important;" disabled>
                                    <i class="fas fa-check" style="color:#31ce36;"></i>　대표 서명
                                  </button>`
							: `<button class="btn btn-border btn-primary ms-2" id="setDefaultSign_${sign.signNum}">대표 서명 설정</button>`}
                            <button class="btn btn-danger ms-2" id="deleteSign_${sign.signNum}">서명 삭제</button>
                        </td>
					`;
					tableBody.appendChild(row);
					
				});
			}

			// 서명 추가 버튼 표시 여부 업데이트
			const addSignatureButton = document.getElementById('alert_signature_pad');
			addSignatureButton.style.display = signList.length < 3 ? 'block' : 'none';

			// 이벤트 리스너 추가
			addSignatureEventListeners();
		})
		.catch(error => console.error('서명 목록 업데이트 실패:', error));
}

// 이벤트 리스너 추가 함수
function addSignatureEventListeners() {
	
	// 대표 서명 설정
	document.querySelectorAll("[id^=setDefaultSign_]").forEach(button => {
		button.addEventListener("click", function() {
			const signNum = this.id.split('_')[1];
			fetch(`/approval/signaturePad/setDefaultSign?signNum=${signNum}`, { method: 'POST' })
				.then(response => response.json())
				.then(data => {
					console.log('성공:', data);
					updateSignList(); // 서명 목록 업데이트
				})
				.catch(error => console.error('실패:', error));
		});
	});

	// 서명 삭제
	document.querySelectorAll("[id^=deleteSign_]").forEach(button => {
		button.addEventListener("click", function() {
			const signNum = this.id.split('_')[1];
			fetch(`/approval/signaturePad/deleteSign?signNum=${signNum}`, { method: 'POST' })
			.then(response => response.json())
			.then(data => {
				console.log('성공:', data);
				updateSignList(); // 서명 목록 업데이트
			})
			.catch(error => console.error('실패:', error));
		});
	});
}

// 모달창이 닫힐 때 서명 패드 초기화
$('#signModal').on('hidden.bs.modal', function() {
	signaturePad.clear();
	$('#signTitle').val('');
});

// 기안서 작성 페이지) 서명 리스트 모달에서 서명 작성 모달을 띄울 때 서명 리스트 모달을 닫지 않게
function openSignModal() {
    // 서명 작성 모달 열기
    const signModal = new bootstrap.Modal(document.getElementById('signModal'));
    signModal.show();
}

// 서명 저장 버튼 클릭 이벤트
document.getElementById('saveSignBtn').addEventListener('click', function() {
	
	if (signaturePad.isEmpty()) {
		alert("서명을 입력해 주세요.");
		return;
	}

	const imgURL = signaturePad.toDataURL('image/png');
	const formData = new FormData();
	formData.append('signImage', imgURL);
	const signTitle = document.getElementById('signTitle').value;
	formData.append('signTitle', signTitle);

	fetch('/approval/signaturePad/canvas', {
		method: 'POST',
		body: formData
	})
	.then(response => response.json())
	.then(data => {
		console.log('성공:', data);
		$('#signModal').modal('hide');
		signaturePad.clear(); // 서명 패드 초기화
		updateSignList(); // 서명 목록 업데이트
	})
	.catch(error => console.error('실패:', error));
});

// 서명 선택 버튼 클릭 이벤트 추가
document.getElementById('submitSign').addEventListener('click', function() {
    // 선택된 서명을 찾기
    const selectedSign = document.querySelector('input.selectSignRadio:checked');
    
    if (selectedSign) {
		const signRow = selectedSign.closest('tr');
		const signTitle = signRow.querySelector('.signTitleValue').innerText;
		const signNum = selectedSign.getAttribute('data-sign-num');
		const isDefaultSign = selectedSign.hasAttribute('checked'); // 대표 서명 여부 확인
		const signImagePath = selectedSign.getAttribute('data-sign-image-path'); // 서명 이미지 경로
		
		console.log("서명 이미지 경로:", signImagePath); // 경로 출력

		document.getElementById('hiddenSignNum').value = signNum;
		
        // 서명 선택 버튼의 텍스트 및 name 속성 업데이트
		const signSelectButton = document.getElementById('signListModalBtn');
		signSelectButton.innerText = signTitle; // 서명 이름 삽입
		
		// 새로 선택한 서명이 대표 서명이 아닐 경우 대표 서명 체크 해제
		const defaultSignCheckbox = document.getElementById('defaultSign');
		if (!isDefaultSign) {
		    defaultSignCheckbox.checked = false;
		} else {
			defaultSignCheckbox.checked = true;
		}	
		
		// 기안자(혹은 결재자) 서명 이미지 삽입
		const drafterSign = document.getElementById('drafterSign');
		const midApprSign = document.getElementById('midApprSign');
		const finApprSign = document.getElementById('finApprSign');
		
		const loginID = document.getElementById('hiddenLoginID');
		const approver1 = document.getElementById('hiddenApprover1');
		const approver2 = document.getElementById('hiddenApprover2');
		const approver3 = document.getElementById('hiddenApprover3');
		
		if(loginID.value == approver1.value) {
			midApprSign.innerHTML = `<img src="${signImagePath}" alt="서명 이미지" style="height: 100%; width: 100%; margin: 0px !important;">`;		
		}
		else if(loginID.value == approver2.value) {
			finApprSign.innerHTML = `<img src="${signImagePath}" alt="서명 이미지" style="height: 100%; width: 100%; margin: 0px !important;">`;
		}
		else {
			drafterSign.innerHTML = `<img src="${signImagePath}" alt="서명 이미지" style="height: 100%; width: 100%; margin: 0px !important;">`;
		}
		
		
		// 결재자 서명 이미지 삽입
		
		// 모달 닫기
		const signListModal = document.getElementById('signListModal');
		const modal = bootstrap.Modal.getInstance(signListModal); // 기존 인스턴스 가져오기
		modal.hide(); // 모달 닫기
		
		// 이거 안됨
		// const signListModal = new bootstrap.Modal(document.getElementById('signListModal'));
		// signListModal.hide();
		// 이미 열려있는 기존 인스턴스를 가져와야하기 때문		
    }
	else {
		alert("서명을 선택해 주세요."); // 선택 안 된 경우 메시지 표시
	}
});



// 대표 서명 체크박스 클릭 이벤트 추가
document.getElementById('defaultSign').addEventListener('click', function() {
	
	
	const drafterSign = document.getElementById('drafterSign');
	const midApprSign = document.getElementById('midApprSign');
	const finApprSign = document.getElementById('finApprSign');

	const loginID = document.getElementById('hiddenLoginID');
	const approver1 = document.getElementById('hiddenApprover1');
	const approver2 = document.getElementById('hiddenApprover2');
	const approver3 = document.getElementById('hiddenApprover3');
	
    const isChecked = this.checked;
    if (isChecked) {
        // 대표 서명으로 설정된 서명 값 찾기
		fetch('/approval/signaturePad/getDefaultSign', {
		    method: 'POST',
		    headers: {
		        'Content-Type': 'application/json'
		    },
		    body: JSON.stringify({ requestType: 'getDefaultSign' }) // 요청에 필요한 데이터 포함
		})
            .then(response => response.json())
            .then(data => {
                if (data && data.signNum) {
                    // 대표 서명 값이 있을 경우 값 삽입
                    document.getElementById('hiddenSignNum').value = data.signNum;
                    document.getElementById('signListModalBtn').innerText = data.signTitle;
					// 기안자 서명 이미지 삽입
					if(loginID.value == approver1.value) {
						midApprSign.innerHTML = `<img src="/file/signature/${data.signImage}" alt="서명 이미지" style="height: 100%; width: 100%; margin: 0px !important;">`;		
					}
					else if(loginID.value == approver2.value) {
						finApprSign.innerHTML = `<img src="/file/signature/${data.signImage}" alt="서명 이미지" style="height: 100%; width: 100%; margin: 0px !important;">`;
					}
					else {
						drafterSign.innerHTML = `<img src="/file/signature/${data.signImage}" alt="서명 이미지" style="height: 100%; width: 100%; margin: 0px !important;">`;
					}
					
										
                } else {
                    alert("대표 서명이 설정되지 않았습니다.");
                    this.checked = false; // 체크 해제
                }
            })
            .catch(error => {
                console.error('대표 서명 값 가져오기 실패:', error);
                this.checked = false; // 체크 해제
            });
    } else {
        // 체크 해제 시 기본값으로 초기화
        document.getElementById('hiddenSignNum').value = '';
        document.getElementById('signListModalBtn').innerText = '서명 선택';
		
		if(loginID.value == approver1.value) {
			midApprSign.innerHTML = '';		
		}
		else if(loginID.value == approver2.value) {
			finApprSign.innerHTML = '';
		}
		else {
			drafterSign.innerHTML = '';
		}		
		
		
		
    }
});

