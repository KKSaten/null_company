// 기안일
const draftDate = new Date();
document.getElementById('draftDateValue').textContent = draftDate.toISOString().substring(0, 10);	

//만료일
document.addEventListener('DOMContentLoaded', function() {
    const expiryDate = new Date();
    expiryDate.setFullYear(today.getFullYear() + 2);
    document.getElementById('expiryDate').value = expiryDate.toISOString().substring(0, 10);
});
$(function() {
    $(".calendar-icon").on("click", function() {
        $("#expiryDate").datepicker("show");
    });
});

// 연차 날짜
const vacationStart = new Date();
const vacationEnd = new Date();
document.addEventListener('DOMContentLoaded', function() {
	document.getElementById('vacationStart').value = '연차 시작 날짜';
	document.getElementById('vacationEnd').value = '연차 종료 날짜';
});
$(function() {
    $(".calendar-icon-vacSt").on("click", function() {
        $("#vacationStart").datepicker("show");
    });
});
$(function() {
    $(".calendar-icon-vacEnd").on("click", function() {
        $("#vacationEnd").datepicker("show");
    });
});

// 날짜 비교 함수
function checkVacationDates(target) {
	const startDate = new Date($("#vacationStart").val());
	const endDate = new Date($("#vacationEnd").val());

    // 시작 날짜가 종료 날짜보다 이후인 경우 경고
	if (startDate && endDate && startDate > endDate) {
	    if (target === "start") {
	        alert("연차 시작 날짜는 종료 날짜보다 앞서야 합니다.");
	        $("#vacationStart").val('연차 시작 날짜'); // 시작 날짜 초기화
	    } else if (target === "end") {
	        alert("연차 종료 날짜는 시작 날짜보다 앞설 수 없습니다.");
	        $("#vacationEnd").val('연차 종료 날짜'); // 종료 날짜 초기화
	    }
	}
}

// 날짜 차이
function calculateDateDifference() {
    const startDate = new Date($("#vacationStart").val());
    const endDate = new Date($("#vacationEnd").val());

	// 날짜 차이를 밀리초 단위로 계산
	const timeDifference = endDate - startDate;
	
	// 밀리초를 일 수로 변환 + 1
	const dayDifference = (timeDifference / (1000 * 60 * 60 * 24)) + 1;
	
	if(isNaN(dayDifference)) {
		document.getElementById('dayDifference').innerText = '';
		return;
	}
	document.getElementById('dayDifference').innerText = dayDifference;
}

// datepicker가 날짜 선택될 때마다 checkVacationDates 호출
$(function() {
	$("#vacationStart").datepicker({
	    dateFormat: 'yy-mm-dd',
	    onClose: function() {
	        checkVacationDates("start"); // 시작 날짜 확인
			calculateDateDifference();
	    }
	});
	
	$("#vacationEnd").datepicker({
	    dateFormat: 'yy-mm-dd',
	    onClose: function() {
	        checkVacationDates("end"); // 종료 날짜 확인
			calculateDateDifference();
	    }
	});    
});


