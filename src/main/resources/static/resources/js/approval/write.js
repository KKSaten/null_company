$(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
	  // 에디터 높이
	  height: 600,
	  // 에디터 한글 설정
	  lang: "ko-KR",
	  // 에디터에 커서 이동 (input창의 autofocus)
	  focus : true,
	  toolbar: [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],	
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','	help']]
		  ],
		  // 추가한 글꼴
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		 // 추가한 폰트사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		callbacks : { 
			onImageUpload : function(files) {
				// 파일 업로드(다중업로드를 위해 반복문 사용)
				for (var i = files.length - 1; i >= 0; i--) {
					uploadSummernoteImageFile(files[i],this);
				}
			}
		}
	 });

	/**
	* 이미지 파일 업로드
	*/
	function uploadSummernoteImageFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/notice/uploadSummernoteImageFile",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('insertImage', data.url);
			}
		});
	}
});


// 임시 저장
document.getElementById('tempBtn').addEventListener('click', function(event) {	
	
	event.preventDefault(); // 버튼 클릭으로 발생한 submit 중지

	const formData = new FormData(document.getElementById('draftDocForm'));	

	const docContent = document.getElementById('docContent').innerHTML;
	formData.append('docContent', docContent);
	
	const tempStorage = 's';
	formData.append('tempStorage', tempStorage);
	
	// Ajax 요청
	fetch('/approval/write', {
	    method: 'POST',
	    body: formData
	})
	.then(response => {
	    if (!response.ok) {
	        throw new Error('췤더마이크로폰원투원투제이슨이즈낫옼께이 : ' + response.status);
	    }
	    return response.json(); // 응답을 JSON으로 변환	
	})
	.then(data => {
		alert("이후 임시보관함에서 수정하실 수 있습니다.")
		console.log('성공: ', data);
		location.href = '/approval/approvalDocTempStorage';
	})
	.catch(error => {
		alert("Error");
	    console.error('에러났슈: ', error);
	});
	

});


// 상신
document.getElementById('draftBtn').addEventListener('click', function(event) {	
	
	event.preventDefault(); // 버튼 클릭으로 발생한 submit 중지
	
	const docTitle = document.getElementById('docTitle').value.trim(); // 문서 제목 가져오기
	const apprLine = document.getElementById('apprLineBtn').innerText;
	const sign = document.getElementById('signListModalBtn').innerText; 
	
	if (docTitle == "" || apprLine == "결재선 설정" || sign == "서명 선택") {
		alert("빈칸 입력 바랍니다.");
		return;
	}
	
	const inputs = document.querySelectorAll(".inputValue");
	inputs.forEach(input => {
		if (input.tagName.toLowerCase() === "textarea") {
		    // textarea는 'value' 속성 대신 텍스트 콘텐츠를 설정합니다.
		    input.textContent = input.value;
			//결재자 쪽에서 input 값을 수정할 수 없도록
			input.setAttribute("readonly", true);
		} else {
		    // input 요소는 'value' 속성을 설정합니다.
		    input.setAttribute("value", input.value);
			input.setAttribute("readonly", true);
		}
	});
	

	const formData = new FormData(document.getElementById('draftDocForm'));
	const docContent = document.getElementById('docContent').innerHTML;
	formData.append('docContent', docContent);
	
	// Ajax 요청
	fetch('/approval/write', {
	    method: 'POST',
	    body: formData
	})
	.then(response => {
	    if (!response.ok) {
	        throw new Error('췤더마이크로폰원투원투제이슨이즈낫옼께이 : ' + response.status);
	    }
	    return response.json(); // 응답을 JSON으로 변환	
	})
	.then(data => {
		console.log('성공: ', data);
		location.href = '/approval/approvalDocbox';
	})
	.catch(error => {
		alert("Error");
	    console.error('에러났슈: ', error);
	});
	

});



