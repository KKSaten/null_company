const test = document.getElementById("test");

test.addEventListener("click", ()=>{
    fetch("/employee/test?empId=244812", {
        method:"get"
    }).then(r=>r.json())
    .then(r=>{
        
    })
})