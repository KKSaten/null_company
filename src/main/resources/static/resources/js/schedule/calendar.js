
document.addEventListener('DOMContentLoaded', function() {

    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        
    headerToolbar: {
        left: 'today',
        center: 'prev title next',
        right: 'dayGridMonth,timeGridWeek,timeGridDay',
    },
    titleFormat: function (date) {
        // 컨트롤러에서 데이터를 보내주지도 않았는데 date 변수가 어디서 튀어나오나 했더니,
        // Fullcalendar에서 자동적으로 제공하는 변수라고 한다.
        // date.date는 날짜 정보를 담고있는 객체이다
        return `${date.date.year}년 ${date.date.month + 1}월`;
    },
    initialView: 'dayGridMonth',
    selectable: true,   // true : 날짜를 클릭할 수 있다
    dayMaxEvents: true,  // true : 이벤트가 많아지면 + 로 이벤트를 표시


    // *** 캘린더에 list를 보여주는 함수 ***
    /* successCallback은 서버에서 받은 데이터를 가공한 후 여기로 전달하면
       FullCalendar가 이 데이터를 캘린더 화면에 랜더링한다. */
    /* fetchInfo는 FullCalendar가 자동으로 제공하는 인자값으로,
        없으면 작동되지 않을 뿐더러 반드시 첫 번째 인자로 받아야 한다 */
    events: function(fetchInfo, successCallback){

        fetch("/schedule/calendarList")
        .then((response)=>{return response.json()})
        .then(data=>{
            let events = data.map(eventData => ({
                title: eventData.scheduleTitle,
                start: eventData.scheduleStart,
                end: eventData.scheduleEnd
            }));
            successCallback(events);  // FullCalendar에 이벤트 전달
        })
    }
    });
    calendar.render();
});