const indexNotice = document.getElementById("indexNotice");


preview();

function preview(){

    fetch("/notice/preview")
    .then((r)=>{return r.text()})
    .then(r=>{
        indexNotice.innerHTML=r;
    })
}