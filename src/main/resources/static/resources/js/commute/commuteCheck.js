
const clockInButton = document.getElementById("alert_demo_8");
const clockOutButton = document.getElementById("alert_demo_7");
let isClockedIn = false; // 출근 상태를 관리하는 변수

let lastCheckedDate = localStorage.getItem('lastCheckedDate') || null; // 마지막 체크한 날짜 저장

// 현재 날짜 가져오기
const today = new Date();
const todayString = today.toISOString().split('T')[0]; // YYYY-MM-DD 형식으로 오늘 날짜 가져오기

// 날짜가 변경되었는지 확인
if (lastCheckedDate !== todayString) {
    // 날짜가 변경된 경우 버튼 상태를 초기화하고 날짜 업데이트
    lastCheckedDate = todayString;
    localStorage.setItem('lastCheckedDate', lastCheckedDate);
    
    // 초기 버튼 상태 설정
    clockInButton.style.display = 'block';
    clockOutButton.style.display = 'none';
}

// 상태 체크
if (clockInButton) {
    fetch("/commute/statusCheck", {
        method: "POST",
    })
    .then((response) => {
        return response.json();
    })
    .then((response) => {
        // 0: 결근(출근 안해서 자동으로 결근 처리)  --> 아무것도 안뜸 (인사과에서 처리 후 출근상태로 변경됨)
        // 1: 출근                                --> 퇴근
        // 2: 퇴근                                --> 아무것도 안뜸
        // null: 출근 안했고, 출근시간도 안지남     --> 출근
        if (response == 0 || response == 2) {
            clockInButton.style.display = 'none';
            clockOutButton.style.display = 'none';
        } else if (response == 1) {
            clockInButton.style.display = 'none';
            clockOutButton.style.display = 'block'; // 퇴근 버튼 보이기
        } else {
            clockInButton.style.display = 'block'; // 출근 버튼 보이기
            clockOutButton.style.display = 'none';
        }
    })
    .catch((error) => {
        console.error("Error fetching status:", error);
    });
}


    clockOutButton.addEventListener("click", function (e) {
        swal({
            title: "퇴근하시겠습니까?",
            text: "",
            icon: "warning",
            buttons: {
                cancel: {
                    visible: true,
                    text: "취소",
                    className: "btn btn-danger",
                },
                confirm: {
                    text: "승인",
                    className: "btn btn-success",
                },
            },
        }).then((willClockOut) => {
            if (willClockOut) {
                clockOut(); // 퇴근 처리
                toggleButtons(); // 퇴근 후 버튼 전환
            } else {
                swal("퇴근처리를 실패하였습니다", {
                    buttons: {
                        confirm: {
                            className: "btn btn-danger",
                        },
                    },
                });
            }
        });
    });

// 출근 처리 함수
function clockIn() {
    swal("출근처리가 완료되었습니다!", { icon: "success" })
    .then(
        fetch("/commute/checkIn", {
            method: "POST",
        })
    );
}

// 퇴근 처리 함수
function clockOut() {
    swal("퇴근처리가 완료되었습니다!", { icon: "success" })
    .then(
        fetch("/commute/checkOut", {
            method: "POST",
        })
    );
}

// 버튼 토글 함수: 출근/퇴근 버튼 전환
function toggleButtons() {
    if (clockInButton.style.display !== 'none') {
        clockInButton.style.display = 'none';
        clockOutButton.style.display = 'block';
    } else {
        clockInButton.style.display = 'block';
        clockOutButton.style.display = 'none';
    }
}