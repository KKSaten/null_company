const commentDiv = document.getElementById("commentDiv");
const commentContents = document.getElementById("commentContents");
const commentBtn = document.getElementById("commentBtn");
const commentDel = document.getElementsByClassName("commentDel");

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
    
        fetch("/comment/delete?commentNum="+commentNum, {
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


commentDiv.addEventListener("click", (e)=>{ 
            
    if(e.target.classList.contains("commentMod")){
        
        e.target.parentNode.nextElementSibling.remove();
        e.target.parentNode.parentNode.innerHTML="dsdassd";
    }
})