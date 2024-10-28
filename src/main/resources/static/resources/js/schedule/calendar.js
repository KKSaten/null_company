
document.addEventListener('DOMContentLoaded', function() {

    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {

        googleCalendarApiKey : "AIzaSyCOezFD94o9I25l3b7f3O27KAsjAcCk0HY",
        eventSources :[ 
            {
                googleCalendarId : 'l9ijikc83v1ne5s61er6tava4iplm8id@import.calendar.google.com',
                color: 'white',
                textColor: 'red'
            } 
        ],


        // 기본 설정 영역
        initialView: 'dayGridMonth', // 최초로 보여지는 화면
        selectable: true,   // 셀을 클릭할 수 있다
        dayMaxEvents: true,  // 이벤트가 많아지면 +로 이벤트를 표시
        editable: true, // 이벤트 드래그 및 리사이즈 가능
        locale: 'Ko',   // 한글 출력
        
        // 상단의 툴바 설정
        headerToolbar: {
            left: 'today,addButton',
            center: 'prev title next',
            right: 'dayGridMonth,timeGridWeek,timeGridDay',
        },
        
        titleFormat: function (date) {
            // date는 Fullcalendar에서 기본으로 제공하는 변수.
            // date.date는 날짜 정보를 담고있다.
            return `${date.date.year}년 ${date.date.month + 1}월`;
        },

        // DB에 있는 schedule List를 보여주는 코드
        // successCallback으로 가공한 데이터를 전달하면 Fullcalendar가 화면에 렌더링한다.
        /* fetchInfo는 FullCalendar에서 기본으로 제공하는 변수로,
            없으면 작동되지 않을 뿐더러 반드시 첫 번째 인자로 받아야 한다 */
        events: function(fetchInfo, successCallback){
    
            fetch("/schedule/calendarList")
            .then((response)=>{return response.json()})
            .then(data=>{
                let events = data.map(eventData => {
                    let eventColor;
                    
                    // 카테고리에 따라 색상을 다르게 보여주는 코드
                    if (eventData.scheduleCategory.includes("연차")) {
                        eventColor = "rgb(229 85 99)"; // '연차'는 빨강
                    } else if (eventData.scheduleCategory.includes("마감")) {
                        eventColor = "black"; // '마감'은 검정
                    } else if (eventData.scheduleCategory.includes("회의")) {
                        eventColor = "#3788d8e"; // '회의'는 파랑
                    }  else {
                        eventColor = "green"; // 기본값은 초록
                    }
        
                    return {
                        id: eventData.scheduleNum,
                        title: eventData.scheduleTitle,
                        start: eventData.scheduleStart,
                        end: eventData.scheduleEnd,
                        // extendedProps는 사용자가 직접 정의하는 속성
                        extendedProps: {
                            contents: eventData.scheduleContents,
                            category: eventData.scheduleCategory,
                            authorName: eventData.employeeVO.empName,
                            empNum: eventData.empNum
                        },
                        backgroundColor: eventColor, // 카테고리에 따라 색상 지정
                        classNames: ['custom-event'], // 이벤트에 css를 적용하기 위해 class를 부여
                        display: "block"
                    };
                });
                successCallback(events);  // FullCalendar에 이벤트 전달
            })
        },

        
        // 클릭된 이벤트의 상세 정보를 modal로 표시
        // 데이터를 백엔드에서 받아오지 않고 스크립트에서 콜백 함수로 처리
        // info에 이벤트에 대한 데이터가 담겨있다
        eventClick: function(info) {

            // 구글 캘린더로 가져온 공휴일은 클릭 이벤트 자체가 실행되지 않게 하는 코드
            // 이걸 하지 않으면 클릭시 연결된 구글 캘린더 url로 이동된다.
            if(info.event.extendedProps.contents == undefined){
                // 클릭 시 기본 동작 중지
                info.jsEvent.preventDefault();
                info.jsEvent.stopPropagation();

                return;
            }
                    
            // 각 필드에 이벤트 정보 설정
            document.getElementById('scheduleNum').value = info.event.id;
            document.getElementById('scheduleTitle').value = info.event.title;
            document.getElementById('scheduleContents').value = info.event.extendedProps.contents,
            document.getElementById('scheduleCategory').value = info.event.extendedProps.category,
            document.getElementById('scheduleStart').value = info.event.startStr.substring(0, 10);
            document.getElementById('scheduleEnd').value = info.event.endStr.substring(0, 10);

            // security의 담겨있는 사용자 정보를 가져온다
            const loginUser = document.getElementById("loginUser");
            
            // 로그인한 유저와 일정 작성자가 다를 경우 수정/삭제 버튼에 hidden 속성을 추가
            if(loginUser.value != info.event.extendedProps.empNum){
                document.getElementById("modifyBtn").setAttribute("hidden", true);
                document.getElementById("deleteBtn").setAttribute("hidden", true);
            }else{
                document.getElementById("modifyBtn").removeAttribute("hidden");
                document.getElementById("deleteBtn").removeAttribute("hidden");
            }
            
            // modal 열기
            const modal = document.getElementById('detailEventModal');
            modal.style.display = 'block'; 
            
            // modal 닫기 (modal 배경 클릭 시 닫기)
            window.onclick = function(event) {
                if (event.target === modal) {
                    modal.style.display = 'none';
                }
            }
            
            // '삭제' 버튼의 href에 주소와 파라미터를 넣어줌
            document.getElementById('deleteBtn').href = "/schedule/delete?scheduleNum=" + info.event.id;
        },
        

        // '일정 등록'을 위한 커스텀 버튼 설정과 클릭시 발생하는 이벤트 설정
        customButtons:{
            addButton:{
                text: "일정 추가",
                click: function(){
                    // modal 열기
                    const modal = document.getElementById('addEventModal');
                    modal.style.display = 'block';
        
                    // modal 닫기 (modal 배경 클릭 시 닫기)
                    window.onclick = function(event) {
                        if (event.target === modal) {
                            modal.style.display = 'none';
                        }
                    }
                }
            }
        },


        /* Fullcalendar는 기본적으로 이벤트에 title, start만 보여줌
            때문에 원하는 내용을 보여주기 위해 렌더링되는 내용을 커스터마이즈 하는 코드 */
        eventContent: function(info) {
            let authorName = info.event.extendedProps.authorName; // 일정 작성자 이름

            /* 구글 캘린더로 가져온 공휴일은 작성자 이름이 undefined이기 때문에
                공휴일은 이름을 보여주지 않고 title만 표시한다 */
            if(authorName == undefined){
                return {
                    html:
                    `
                        <div>
                            <span>${info.event.title}</span><br>
                        </div>
                    `
                };
            }
        
            // 커스터마이즈된 HTML 반환
            return {
                html:
                `
                    <div>
                        <strong>${authorName}</strong><br>
                        <span>${info.event.title}</span><br>
                    </div>
                `
            };
        },


        // '드래그&드랍'으로 이벤트 날짜 수정
        eventDrop: function(info) {

            // 날짜만 바뀌기 때문에 id와 start, end만 가져온다
            let event = {
                id: info.event.id,
                start: info.event.startStr,
                end: info.event.endStr
            };
        
            fetch("/schedule/dragUpdate", {
                method: "PUT",
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(event)
            }).then(response => response.text())
            .then(data => {
                if (data === 'success') {}
                else {
                    alert("타인의 일정은 수정이 불가능합니다.");
                    info.revert(); // 오류 발생 시 원래 위치로 되돌리기
                }
            });
        },
    });
    
    calendar.render();
});