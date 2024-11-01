// 결재선 설정 모달창 사원 검색
document.getElementById('searchEmpName').addEventListener('input', function () {
	const filter = this.value.toLowerCase();
	const empItems = document.querySelectorAll('.emp-item');
	const collapses = document.querySelectorAll('.collapse');		
	
	// 모든 collapse 닫기
	collapses.forEach(collapse => {
		collapse.classList.remove('show');
	});

	let foundMatch = false;

	empItems.forEach(item => {
		const empName = item.querySelector('.empName').textContent.toLowerCase();
		if (empName.includes(filter)) {
			item.parentElement.style.display = ''; // 매치된 항목 보이기
			item.style.backgroundColor = '#e1f3fd'; // 검색된 사원 배경색
			const collapseElement = item.closest('.collapse');
            
			// 매치되는 사원이 있는 부서를 열기
			if (collapseElement && !collapseElement.classList.contains('show')) {
				collapseElement.classList.add('show');
			}
				
			foundMatch = true;
		}
		else {
			item.style.backgroundColor = '';
			/* item.parentElement.style.display = 'none'; // 매치되지 않는 항목 숨기기 */
		}
	});

	// 검색어가 없을 때 모든 부서 닫기
	if (!filter) {
		empItems.forEach(item => {
			item.style.background ='';
		});
		document.querySelectorAll('.collapse').forEach(collapse => {
			collapse.classList.remove('show');
		});
	}
});



// 사원 리스트에서 사원 선택    
let selectedEmp = null;

document.querySelectorAll('.emp-item').forEach(item => {
    item.addEventListener('mouseover', function() {
        // 현재 마우스 오버된 항목 강조
        selectedEmp = this;
        selectedEmp.style.backgroundColor = '#eaeaea';
    });
    item.addEventListener('mouseout', function() {
    	// 마우스 아웃된 항목 강조 해제
    	selectedEmp = this;
		selectedEmp.style.backgroundColor = '';        	
    });
});



// 모달이 열릴 때 초기화
const apprLineModal = document.getElementById('apprLineModal');
apprLineModal.addEventListener('show.bs.modal', function () {
    // 선택된 템플릿 초기화
    if (selectedEmp) {
        selectedEmp.style.backgroundColor = ''; // 선택 해제
        selectedEmp = null;
    }

    // 모든 collapse를 닫음
    document.querySelectorAll('.collapse').forEach(collapse => {
        collapse.classList.remove('show');
    });
});	    




// 사원 리스트에서 결재 라인에 결재자로 추가 기능

// 결재자 수 카운트
let approverCount = 0;
// 추가된 결재자 리스트
let addedApprovers = [];
// 저장 여부 확인
let isSaved = false;

// 좌측 사원 리스트	
$("#apprLineModalBody1").on("click", ".approverPlusBtn", function(){
	if (approverCount >= 3) { // 결재자는 최대 3명까지만 추가
	    return;
	}
	const empNum = $(this).siblings('.hiddenEmpNum').val();	
    const empName = $(this).siblings('.empName').text();
    const deptName = $(this).siblings('.hiddenDeptName').val();
    const posName = $(this).siblings('.posName').text();	
    
    // 결재 라인에 추가할 새로운 구조 생성
    const newApprovalLine = `
        <tr class="approverField">
            <td colspan="5" style="text-align: center !important;">
                <i class="fas fa-caret-down" style="zoom: 1.5;"></i>
            </td>
        </tr>
        <tr class="approverField">
            <td>
                <i class="fas fa-times removeApprover" style="zoom: 1.5; color: #d9534f; cursor: pointer; margin-left: 10px;"></i>
            </td>
            <td>
				${empName}
				<input class="hiddenEmpNum" type="hidden" value="${empNum}">
			</td>
            <td>${posName}</td>
            <td>${deptName}</td>
            <td></td>
        </tr>
    `;

    // apprLineTable에 새로운 결재 라인 추가
    $('.apprLineTable tbody').append(newApprovalLine);
			
	approverCount++;
	addedApprovers.push(empNum); // 추가된 사원 empNum 저장
	
	$(this).hide(); // 추가한 사원의 + 버튼 숨김
	
	// 결재자 수 3명 찍으면 + 버튼 감추기
	if (approverCount >= 3) {
	    $('.approverPlusBtn').hide();
	}
})


// 결재자 제거
$('#apprLineModalBody2').on('click','.removeApprover' , function() {
	
	const currentRow = $(this).closest('tr');
	// 결재자 라인에 추가된 결재자의 empNum
	const empNum = currentRow.find('.hiddenEmpNum').val();
	
	currentRow.prev().remove(); // 현재 결재자 행 이전 행(화살표 아이콘) 삭제
	currentRow.remove(); // 현재 결재자 행을 삭제
	
    approverCount--;
	
	// 추가된 empNum 리스트에서 제거
	addedApprovers = addedApprovers.filter(code => code !== empNum);

    // 결재자 수가 3명 미만이 되면 추가 버튼 다시 보임
    if (approverCount < 3) {
        $('.approverPlusBtn').show();
    }
	
	// 결재라인 리스트에 결재자가 추가되어있는지 판별
	$('.emp-item').each(function () {
	    const empNumInList = $(this).find('.hiddenEmpNum').val();
	    if (!addedApprovers.includes(empNumInList)) { // 결재자가 아닌 경우 + 버튼 보이기
	        $(this).find('.approverPlusBtn').show(); 
	    } else {
	        $(this).find('.approverPlusBtn').hide(); 
	    }
	});
	
});
	
	
// 결재라인 저장
$('#submitApprLine').on('click', function() {
	
	if (approverCount == 0) {
		alert("결재라인을 지정해주세요.");
		return;
	}
	
	isSaved = true; // 저장 상태를 true로 변경
	
});
	
	
// 저장한 경우를 제외하고 모달창이 닫히면 모달 초기화
$('#apprLineModal').on('hidden.bs.modal', function () {
    if (!isSaved) { // 저장되지 않은 경우에만 초기화
        // 초기화 로직
        approverCount = 0;
        addedApprovers = [];
        $('.approverField').remove(); // 결재 라인 초기화
        $('.approverPlusBtn').show(); // 모든 + 버튼 다시 보이기
    }
    isSaved = false; // 다음을 위해 저장 상태 초기화
});
