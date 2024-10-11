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
if(commentBtn != null){
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
}

// 댓글을 삭제하고 리스트를 새로 가져오는 함수
if(commentDel != null){
    for(let del of commentDel){

        let commentNum = del.getAttribute("data-comment-del");

        del.addEventListener("click", ()=>{

            console.log(commentNum);

            fetch("/comment/delete?commentNum="+commentNum, {
                method:"GET"
            })
            .then((r)=>{return r.text()})
            .then((r)=>{
                if(r>0){
                    alert("댓글이 정상적으로 삭제되었습니다.");
                    getList();
                }
            })
        })
    }
}