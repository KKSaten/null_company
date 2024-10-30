function addPerson (deptNum) {
    const parenttd = document.getElementById("dept"+deptNum);
    const icon = document.getElementById("icon"+deptNum);
    const deptList = document.getElementsByClassName("deptList");
    const allIcon = document.getElementsByClassName("allIcon");

   
   if(icon.classList.contains("degree")){
       icon.classList.remove("degree");
        const fadein = parenttd.childNodes;

        fadein.forEach((f, index)=>{
            f.classList.replace("fade-in", "fade-out")

            setTimeout(() => {
                f.classList.replace("show", "hide") // 일정 시간 후 'show' 클래스를 추가하여 애니메이션 실행
            }, 10 * (index+1)); // 타임아웃을 0으로 설정하여 바로 실행되도록 함
        })

        console.log(fadein.firstChild())
       
        // while (fadein.firstChild) {
        //     fadein.removeChild(fadein.firstChild);
        // }
       
       return;
   }

    fetch("getEmp", {
        method:"POST",
        headers:{"Content-Type":"application/json"},
        body: JSON.stringify({
            'deptNum': deptNum
        })
    })
    .then(r=>r.json())
    .then(r=>{



        //css 화살표 각도 변경
        icon.classList.toggle("degree")

        //테이블 생성, 추가
        //index 번호 매개변수
        r.forEach((vo, index) => {
            const tr= document.createElement("tr");
            tr.classList.add("fade-in");
            tr.setAttribute('onclick',`test(${vo.empNum})`)
            const td = document.createElement("td");
            td.innerHTML='&nbsp;&nbsp;&nbsp;'+vo.roleVO.roleName+'&nbsp;'+vo.empName;
            
            tr.append(td);
            
            parenttd.append(tr);

            setTimeout(() => {
                tr.classList.add("show"); // 일정 시간 후 'show' 클래스를 추가하여 애니메이션 실행
            }, 10 * (index+1)); // 타임아웃을 0으로 설정하여 바로 실행되도록 함
        
        });

    })
    
}

function test(a) {
    console.log(a)
}