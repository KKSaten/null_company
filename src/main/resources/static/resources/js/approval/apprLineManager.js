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
$(document).ready(function() {
	
	// 결재자 수 카운트
	let approverCount = 0;
	// 추가된 결재자 리스트
	let addedApprovers = [];
	
    $('.approverPlusBtn').on('click', function() {
		
		if (approverCount >= 3) {
		    return;
		}
		
		const empNum = $(this).siblings('.hiddenEmpNum').val();
		if (addedApprovers.includes(empNum)) { // 이미 추가된 사원인지 체크
			return;
		}
		
        const empName = $(this).siblings('.empName').text();
        const deptName = $(this).siblings('.hiddenDeptName').val();
        const posName = $(this).siblings('.posName').text();
        
        // 결재 라인에 추가할 새로운 구조 생성
        const newApprovalLine = `
            <tr>
                <td colspan="5" style="text-align: center !important;">
                    <i class="fas fa-caret-down" style="zoom: 1.5;"></i>
                </td>
            </tr>
            <tr>
                <td>
                    <i class="fas fa-times removeApprover" style="zoom: 1.5; color: #d9534f; cursor: pointer; margin-left: 10px;"></i>
                </td>
                <td>${empName}</td>
                <td>${deptName}</td>
                <td>${posName}</td>
                <td style="text-align: center;">
				</td>
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
		
		// 결재자 제거
		$('.removeApprover').last().on('click', function() {
		    // 해당 결재자 행 삭제
		    $(this).closest('tr').prev().remove(); // caret-down 아이콘 삭제
		    $(this).closest('tr').remove(); // 클릭한 <tr> 삭제
		    approverCount--; // 결재자 수 감소
			
			// 추가된 empNum 리스트에서 제거
			const removedEmpNum = $(this).closest('tr').find('td').eq(1).text(); // 사원 이름으로 대체하여 코드 찾기
			addedApprovers = addedApprovers.filter(code => code !== removedEmpNum);

		    // 결재자 수가 3명 미만이 되면 추가 버튼 다시 보임
		    if (approverCount < 3) {
		        $('.approverPlusBtn').show();
		    }
			
			// 제거된 사원의 + 버튼 다시 보이기
			$('.hiddenEmpNum .approverPlusBtn').show();
		});
		
    });
});
