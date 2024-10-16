const formSelect = document.getElementById("formGroupDefaultSelect");


formSelect.addEventListener("change", ()=>{

    location.href="/notice/list?deptNum=" + formSelect.value;
})