const commentDiv = document.getElementById("commentDiv");
const commentContents = document.getElementById("commentContents");
const commentBtn = document.getElementById("commentBtn");
const commentDel = document.getElementsByClassName("commentDel");
const modContents = document.getElementsByClassName("modContents");
const inputReplys = document.getElementsByClassName("inputReplys")
const reModContents = document.getElementsByClassName("reModContents");

let noticeNum = commentDiv.getAttribute("data-notice-num");


getList();

// 공지사항 post 페이지에 댓글 리스트를 보여주는 함수
function getList(){
    
    fetch("/comment/list?noticeNum="+noticeNum,{
        method:"GET"
    })
    .then((r)=>{return r.text()})
    .then((r)=>{
        commentDiv.innerHTML=r;
    })
}

// 댓글을 추가하고 리스트를 새로 가져오는 함수
commentBtn.addEventListener("click", ()=>{
    
    let form = new FormData();
    form.append("noticeNum", noticeNum);
    form.append("commentContents", commentContents.value);
    
    fetch("/comment/write", {
        method:"POST",
        body: form
    })
    .then((r)=>{return r.text()})
    .then((r)=>{
        if(r > 0){
            alert("댓글이 정상적으로 등록되었습니다.");
            commentContents.value="";
            getList();
        }else{
            alert("댓글을 입력해주세요");
        }
    })
})


// 댓글을 삭제하고 리스트를 새로 가져오는 함수
// comment/list.jsp는 나중에 만들어지는 파일이기 때문에 이벤트를 걸 수 없다.
// 따라서 list.jsp가 삽입되는 commentDiv에다가 이벤트를 걸어준다.
commentDiv.addEventListener("click", (e)=>{ 
            
    if(e.target.classList.contains("commentDel")){
                
        let commentNum = e.target.getAttribute("data-comment-num");

        let form = new FormData();
        form.append("commentNum", commentNum);
    
        fetch("/comment/delete", {
            method:"POST",
            body:form
        })
        .then((r)=>{return r.text()})
        .then((r)=>{
            if(r>0){
                alert("댓글이 정상적으로 삭제되었습니다.");
                getList();
            }
        })
    }
})

// 댓글의 수정버튼 클릭시 입력창이 나오게 하는 함수
commentDiv.addEventListener("click", (e)=>{ 
            
    if(e.target.classList.contains("commentMod")){

        let commentNum = e.target.getAttribute("data-comment-num");

        fetch("/comment/modify?commentNum=" + commentNum + "&noticeNum=" + noticeNum,{
            method:"GET"
        })
        .then((r)=>{return r.text()})
        .then((r)=>{
            commentDiv.innerHTML=r;
        })
    }
})

// 댓글 수정 완료 버튼 클릭시 DB에 수정된 내용으로 업데이트하는 함수
commentDiv.addEventListener("click", (e)=>{

    if(e.target.classList.contains("modSubmit")){

        let commentNum = e.target.getAttribute("data-comment-num");
        
        let form = new FormData();
        form.append("commentNum", commentNum);

        // Class Name으로 선언한 값은 배열에 담기므로 for문을 돌려서 값을 꺼내줘야 한다.
        // 원래는 for문을 돌려서 나온 값 중 내가 원하는 값을 특정하기 위한 조건문이 필요하지만,
        // 현재 화면에서 textarea는 한개만 존재하기 때문에 배열에는 하나만 담기므로 조건문 없이 값을 꺼낼 수 있다
        for(let modContent of modContents){
            form.append("commentContents", modContent.value);
        }

        fetch("/comment/modify", {
            method:"POST",
            body:form
        })
        .then((r)=>{return r.text()})
        .then((r)=>{
            if(r>0){    
                alert("댓글이 정상적으로 수정되었습니다.");
                getList(); 
            }else{
                alert("공백으로 수정은 불가능합니다");
            }
        })
    }
})



// ------------------------------------ Reply (답글) 코드 ----------------------------
// -----------------------------------------------------------------------------------

// 답글 버튼 클릭시 답글 창 보이게 하는 코드
commentDiv.addEventListener("click", (e)=>{

    if(e.target.classList.contains("replyAdd")){

        let commentNum = e.target.getAttribute("data-comment-num");

        fetch("/reply/write?commentNum=" + commentNum + "&noticeNum=" + noticeNum, {
            method:"GET"
        })
        .then((r)=>{return r.text()})
        .then((r)=>{
            commentDiv.innerHTML=r;
        })
    }
})

// 답글 등록 버튼 클릭시 DB에 insert된 내용으로 업데이트하는 함수
commentDiv.addEventListener("click", (e)=>{

    if(e.target.classList.contains("replySubmit")){

        let commentNum = e.target.getAttribute("data-comment-num");
        
        let form = new FormData();
        form.append("commentNum", commentNum);

        for(let inputReply of inputReplys){
            form.append("replyContents", inputReply.value);
        }

        fetch("/reply/write", {
            method:"POST",
            body:form
        })
        .then((r)=>{return r.text()})
        .then((r)=>{
            if(r>0){    
                alert("댓글이 정상적으로 등록되었습니다.");
                getList();
            }else{
                alert("답글을 입력해주세요");
            }
        })
    }
})


// 답글의 수정 버튼 클릭시 수정 창 보이게 하는 코드
commentDiv.addEventListener("click", (e)=>{

    if(e.target.classList.contains("replyMod")){

        let replyNum = e.target.getAttribute("data-reply-num");

        fetch("/reply/modify?replyNum=" + replyNum + "&noticeNum=" + noticeNum, {
            method:"GET"
        })
        .then((r)=>{return r.text()})
        .then((r)=>{
            commentDiv.innerHTML=r;
        })
    }
})


// 댓글 수정 완료 버튼 클릭시 DB에 수정된 내용으로 업데이트하는 함수
commentDiv.addEventListener("click", (e)=>{

    if(e.target.classList.contains("reModSubmit")){

        let replyNum = e.target.getAttribute("data-reply-num");
        
        let form = new FormData();
        form.append("replyNum", replyNum);

        for(let reModContent of reModContents){
            form.append("replyContents", reModContent.value);
        }

        fetch("/reply/modify", {
            method:"POST",
            body:form
        })
        .then((r)=>{return r.text()})
        .then((r)=>{
            if(r>0){    
                alert("답글이 정상적으로 수정되었습니다.");
                getList(); 
            }else{
                alert("공백으로 수정은 불가능합니다");
            }
        })
    }
})


// 답글을 삭제하고 리스트를 새로 가져오는 함수
commentDiv.addEventListener("click", (e)=>{ 
            
    if(e.target.classList.contains("replyDel")){
                
        let replyNum = e.target.getAttribute("data-reply-num");

        let form = new FormData();
        form.append("replyNum", replyNum);
    
        fetch("/reply/delete", {
            method:"POST",
            body:form
        })
        .then((r)=>{return r.text()})
        .then((r)=>{
            if(r>0){
                alert("답글이 정상적으로 삭제되었습니다.");
                getList();
            }
        })
    }
})