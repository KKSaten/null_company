const indexNotice = document.getElementById("indexNotice");


preview();
previewSchedule();

function preview(){

    fetch("/notice/preview")
    .then((r)=>{return r.text()})
    .then(r=>{
        indexNotice.innerHTML=r;
    })
}

function previewSchedule(){
    
    fetch("/schedule/preview")
    .then((r)=>{return r.text()})
    .then(r=>{
        indexSchedule.innerHTML=r;
    })
}