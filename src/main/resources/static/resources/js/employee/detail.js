const modalClose = document.getElementsByClassName("modalClose");
const picModalSave = document.getElementById("picModalSave");
const addrModalSave = document.getElementById("addrModalSave");
const profileimg = document.getElementById("profileimg");
const empAddress = document.getElementById("empAddress");


picModalSave.addEventListener("click", ()=>{

    let formData = new FormData();
    let files = profileimg.files;

    console.log(files)

    if(files.length!=0){
        formData.append("attach",files[0]);
    
        fetch("update", {
            method:"post",
            body:formData
        })
        .then(r=>r.text())
        .then(r=>{

            if(r>0){
                location.reload(true);
            }

        })

        modalClose[0].click()
        return
    }

    alert("사진 첨부 후 저장 버튼 눌러주세요.")
    modalClose[0].click()
}) 

addrModalSave.addEventListener("click", ()=>{

    fetch("update", {
        method:"post",
        headers:{
            "Content-type":"application/x-www-form-urlencoded"
        },
        body:"empAddress="+empAddress.value
    })
    .then(r=>r.text())
    .then(r=>{
        if(r>0){
            location.reload(true);
        }
    })

    modalClose[1].click()
})