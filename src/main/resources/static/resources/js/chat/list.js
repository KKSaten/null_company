//화살표 방향
function chCaret(deptNum){
    const icon = document.getElementById("icon"+deptNum);

    icon.classList.toggle('degree');
}

let roomMember = [];
const roomMemberdiv = document.getElementById("roomMemberdiv");
const makeChatBtn = document.getElementById("makeChatBtn");

//채팅방 생성
makeChatBtn.addEventListener("click", ()=>{
    
    const roomName = document.getElementById("roomName").value;

    console.log(roomName);
    console.log(roomMember);

    var roomInfo = {
        'roomName':roomName,
        'roomMember':roomMember
    }

    fetch("makeRoom",{
        method:'post',
        headers:{
            'Content-Type':'application/json'
        },
        body:JSON.stringify(roomInfo)
    })

})

//채팅 멤버 추가,삭제
function manageMember (empNum) {

    //roomMember 배열에 포함되어있는지 확인
    let flag = roomMember.includes(empNum);

    const addMember = document.getElementById("addMember"+empNum);
    addMember.classList.toggle('addMemberColor');

    if(!flag){

        let empInfo = {'empNum':empNum};

        roomMember.push(empInfo);

        fetch("getEmpDetail",{
            method:'post',
            headers:{
                'Content-Type':'application/json'
            },
            body:JSON.stringify(empInfo)
        })
        .then(r=>r.json())
        .then(r=>{
            //div 생성
            const div = document.createElement('div');
            div.classList.add('col');
            div.setAttribute('align','center');
            div.setAttribute('onClick','manageMember('+empNum+')');
            div.style.cursor="pointer";
            div.id = 'selMember'+empNum;
    
            //img 생성
            const img = document.createElement('img');
            img.src='/file/employee/'+r.employeeFileVO.fileName;
            img.classList.add('circular-image', 'mb-3');
            
            //h6 생성 
            const h6 = document.createElement('h6');
            h6.append(r.empName);
    
            div.append(img,h6);

            roomMemberdiv.append(div);

        })
    } else {
        roomMember = roomMember.filter(value=>value!=empNum);
        const selMember = document.getElementById('selMember'+empNum);
        console.log(selMember);
        selMember.remove();
    }

    //class 추가
    if(roomMember.length == 0){
        roomMemberdiv.classList.remove('roomMemberdiv', 'roomMemberover');
    } else if(roomMember.length > 0 && roomMember.length < 6) {
        roomMemberdiv.classList.add('roomMemberdiv');
        roomMemberdiv.classList.remove('roomMemberover');
    } else if(roomMember.length > 5) {
        roomMemberdiv.classList.add('roomMemberdiv');
        roomMemberdiv.classList.add('roomMemberover');
    }

}