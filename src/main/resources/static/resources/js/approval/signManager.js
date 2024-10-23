const undoData = [];
const canvas = document.getElementById("signature-pad");
const signaturePad = new SignaturePad(canvas, {
	dotSize:2,								// 단일점의 반경, 마크 시작의 너비
	minWidth:2,								// 라인의 최소너비 기본값(0.5)
	maxWidth:4,								// 라인의 최대너비 기본값(2.5)
	penColor: "rgb(43, 43, 43)",			// 펜색상
	backgroundColor: 'rgb(248,248,248)'		// 배경색
});

// 지우기, 되돌리기 //
$("button[data-action]").on("click", function() {
	var action = $(this).data("action");
	
	if(action == "clear") {
		signaturePad.clear();
	}
	else if(action == "undo") {
		const data = signaturePad.toData();
		if(data && data.length > 0) {
			const removed = data.pop();
			undoData.push(removed);
			signaturePad.fromData(data);
		}
	}
});

// 모달창이 닫힐 때 서명 패드 초기화
$('#signModal').on('hidden.bs.modal', function () {
	signaturePad.clear();
});	

// 서명 저장 버튼 클릭 이벤트
document.getElementById('saveSignBtn').addEventListener('click', function() {
    if (signaturePad.isEmpty()) {
        alert("서명을 입력해 주세요.");
        return;
    }

    // 서명 PNG 이미지를 Base64 문자열 형태로 인코딩
    const imgURL = signaturePad.toDataURL('image/png');

    // FormData 객체 생성
    const formData = new FormData();
    
    // 파라미터 추가
    formData.append('signImage', imgURL);
    const signTitle = document.getElementById('signTitle').value;
    formData.append('signTitle', signTitle);

    // AJAX 요청
    fetch('/approval/signaturePad/canvas', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    /*.then(response => {
        console.log('응답 받음:', response); // 응답 확인
        return response.json();
    })*/ 		    
    .then(data => {
        console.log('성공:', data);
        // 모달 닫기 및 서명 초기화
        $('#signModal').modal('hide');
        signaturePad.clear(); // 서명 패드 초기화
        window.location.href = '/approval/signaturePad'; //리다이렉트
    })
    .catch((error) => {
        console.error('실패:', error);
    });
});

//대표 서명 설정
document.querySelectorAll("[id^=setDefaultSign_]").forEach(button => {
    button.addEventListener("click", function() {
        // 버튼의 id에서 signNum 추출
        const signNum = this.id.split('_')[1];

        // AJAX 요청으로 signNum을 서버로 전송
        fetch('/approval/signaturePad/setDefaultSign?signNum='+signNum, {
            method: 'POST',
        })
        .then(response => {
            if (response.ok) {
                return response.json();
            } else {
                throw new Error('네트워크 응답이 정상이 아닙니다.');
            }
        })
        .then(data => {
            if (data === 0) {
                throw new Error('DB 수정에 실패했습니다.');
            }		        	
            console.log('성공:', data);
            // 현재 페이지를 리다이렉트해서 새로고침
            window.location.reload();
        })
        .catch(error => {
            console.error('실패:', error);
        });
    });
});	

//서명 삭제
document.querySelectorAll("[id^=deleteSign_]").forEach(button => {
    button.addEventListener("click", function() {
        // 버튼의 id에서 signNum 추출
        const signNum = this.id.split('_')[1];

        // AJAX 요청으로 signNum을 서버로 전송
        fetch('/approval/signaturePad/deleteSign?signNum='+signNum, {
            method: 'POST',
        })
        .then(response => {
            if (response.ok) {
                return response.json();
            } else {
                throw new Error('네트워크 응답이 정상이 아닙니다.');
            }
        })
        .then(data => {
            if (data === 0) {
                throw new Error('DB 수정에 실패했습니다.');
            }		        	
            console.log('성공:', data);
            // 현재 페이지를 리다이렉트해서 새로고침
            window.location.reload();
        })
        .catch(error => {
            console.error('실패:', error);
        });
    });
});