<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<c:import url="../templates/header.jsp"></c:import>

	<title>서명 관리</title>
</head>
<body>
	<div class="wrapper">
		<div class="main-panel">
			<div class="main-header">
				<c:import url="../templates/sidebar.jsp"></c:import>
				<c:import url="../templates/topbar.jsp"></c:import>
			</div>

			<div class="container">
				<div class="page-inner">

					<div class="page-header mt-3">
						<h3 class="fw-bold mb-3">전자결재</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home">
								<a href="/">
									<i class="icon-home"></i>
								</a>
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="#">전자결재</a>
							</li>							
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="#">결재관리</a>
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="/approval/signaturePad">서명관리</a>
							</li>
						</ul>
					</div>



					<div class="row">


						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="d-flex align-items-center">
										<h4 class="card-title">서명 관리</h4>										
									</div>
								</div>
								<div class="card-body">
								
								
								
								<div class="container" style="text-align: center;">

									<div>
										<h1>서명 리스트</h1>
									</div>
									
									<div class="d-flex justify-content-between" style="max-width: 800px; margin: 0 auto;">
									    <div>
									        <button class="btn btn-primary" id="alert_signature_pad" data-bs-toggle="modal" data-bs-target="#signModal" >서명 추가</button>
									    </div>
									    <div class="d-flex">
									        <button class="btn btn-border btn-primary ms-2">대표 서명 설정</button>
									        <button class="btn btn-danger ms-2" id="">서명 삭제</button>
									    </div>
									</div>
								</div>
									
									
									
									
								<div class="container" style="text-align: center;">
									<div>
										<canvas id="signature-pad" width="auto" height="auto" style="border: 1px solid #ddd; padding: 10px;"></canvas>
									</div>
									
									<div>
										<!-- 지우기, 되돌리기-->
										<button type="button" class="button" data-action="clear">Clear</button>
										<button type="button" class="button" data-action="undo" title="Ctrl-Z">
											<i class="fas fa-undo"></i>
										</button>
										
										<!-- 다운로드 -->
				<!-- 						<button type="button" class="button" data-download="png">PNG</button>
										<button type="button" class="button" data-download="png-with-background">PNG with background</button> -->
										
										<!-- PHP 저장 -->
										<button type="button" class="button" data-save="php">저장</button>
									</div>
								</div>									
									
									
								</div>
							</div>
						</div>
					</div>




					<!-- 모달 -->
					<div class="modal fade" id="signModal" tabindex="-1" aria-labelledby="docModalLabel" aria-hidden="true">
					    <div class="modal-dialog">
					        <div class="modal-content" style="padding: 10px 30px 10px 30px;">
					            <div class="modal-header" style="border:none; ">
					                <h5 class="modal-title" id="docModalLabel">서명 작성</h5>
					                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					            </div>
					            <div class="modal-body">

									<div class="container" style="text-align: center;">
										<div>
											<canvas id="signature-pad" width="auto" height="auto" style="border: 1px solid #ddd; padding: 10px;"></canvas>
										</div>
										
										<div>
											<!-- 지우기, 되돌리기-->
											<button type="button" class="button" data-action="clear">
												<i class="fas fa-eraser"></i>
											</button>
											<button type="button" class="button" data-action="undo" title="Ctrl-Z">
												<i class="fas fa-undo"></i>
											</button>
										</div>
									</div>

					            </div>
					            <div class="modal-footer" style="border:none;">
					                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					                <button type="button" class="btn btn-primary" id="saveSign">저장</button>
					            </div>
					        </div>
					    </div>
					</div>







				</div> <!-- page-inner -->
			</div> <!-- container -->

			<c:import url="../templates/footer.jsp"></c:import>
		</div>
	</div>

	<c:import url="../templates/bootfooter.jsp"></c:import>
	<script src="/resources/js/notice/write.js"></script>
	
	
	
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>
	<script>
	const undoData = [];
	const canvas = document.getElementById("signature-pad");
	const signaturePad = new SignaturePad(canvas, {
		dotSize:1,	// 단일점의 반경, 마크 시작의 너비
	    minWidth:1,	// 라인의 최소너비 기본값(0.5)
	    maxWidth:4,	// 라인의 최대너비 기본값(2.5)
	    penColor: "rgb(43, 43, 43)",	// 펜색상
	    backgroundColor: 'rgb(250,250,250)'	// 배경색
	});
	
	// 지우기, 되돌리기 //
	$("button[data-action]").on("click", function() {
		var action = $(this).data("action");
	    
	    if(action == "clear")
	        signaturePad.clear();
	    else if(action == "undo")
	    {
	        const data = signaturePad.toData();
	        if(data && data.length > 0) {
	            const removed = data.pop();
	            undoData.push(removed);
	            signaturePad.fromData(data);
	        }
	    }
	});
	
	// 단축키 설정 //
	window.addEventListener("keydown", (event) => {
	    switch (true) {
	        case event.key === "z" && event.ctrlKey:
	            $("button[data-action='undo']").click();
	        break;
	    }
	});
	
	// 다운로드 //
	function download(dataURL, filename)
	{
	    const blob = dataURLToBlob(dataURL);
	    const url = window.URL.createObjectURL(blob);
	    const a = document.createElement("a");
	    a.style = "display: none";
	    a.href = url;
	    a.download = filename;
	
	    document.body.appendChild(a);
	    a.click();
	    window.URL.revokeObjectURL(url);
	}
	
	function dataURLToBlob(dataURL) 
	{
	    const parts = dataURL.split(';base64,');
	    const contentType = parts[0].split(":")[1];
	    const raw = window.atob(parts[1]);
	    const rawLength = raw.length;
	    const uInt8Array = new Uint8Array(rawLength);
	
	    for (let i = 0; i < rawLength; ++i) {
	        uInt8Array[i] = raw.charCodeAt(i);
	    }
	
	    return new Blob([uInt8Array], { type: contentType });
	}
	
	$("button[data-download]").on("click", function() {
	var down = $(this).data("download");
	
	    if(down == "png")
	    {
	        if(signaturePad.isEmpty())
	            alert("서명을 해주세요.");
	        else {
	            const dataURL = signaturePad.toDataURL();
	            download(dataURL, "이미지명.png");
	        }
	    }
	    else if(down == "png-with-background")
	    {
	        if(signaturePad.isEmpty())
	            alert("서명을 해주세요.");
	        else {
	            const dataURL = signaturePad.toDataURL('image/png+xml', { includeBackgroundColor: true });
	            download(dataURL, "이미지명.png");
	        }
	    }
	});

	</script>	


	<script>
	    // 선택된 항목을 저장하는 변수
	    let selectedTemplate = null;
	
	    // 모든 template-item 요소를 가져옴
	    document.querySelectorAll('.template-item').forEach(item => {
	        item.addEventListener('click', function() {
	            // 이전에 선택된 항목이 있으면 해제
	            if (selectedTemplate) {
	                selectedTemplate.style.backgroundColor = ''; // 선택 해제 시 원래 색상으로
	            }
	
	            // 현재 클릭된 항목을 선택
	            selectedTemplate = this;
	            selectedTemplate.style.backgroundColor = '#e1f3fd'; // 선택된 항목 강조
	
	            // templateName 저장 (추후 제출 시 활용 가능)
	            const selectedTemplateName = this.getAttribute('data-template-name');
	            console.log('선택된 템플릿:', selectedTemplateName);
	        });
	    });
	
	    // 작성 버튼 클릭 시
	    document.getElementById('submitDoc').addEventListener('click', function() {
	        if (selectedTemplate) {
	            const docTemplatecode = selectedTemplate.getAttribute('data-template-code');
	            location.href = '/approval/write?docTemplatecode=' + docTemplatecode;
	        } else {
	            alert('문서 양식을 선택해주세요.');
	        }
	    });
	    
	    // 모달이 열릴 때 초기화
	    const docModal = document.getElementById('docModal');
	    docModal.addEventListener('show.bs.modal', function () {
	        // 선택된 템플릿 초기화
	        if (selectedTemplate) {
	            selectedTemplate.style.backgroundColor = ''; // 선택 해제
	            selectedTemplate = null;
	        }

	        // 모든 collapse를 닫음
	        document.querySelectorAll('.collapse').forEach(collapse => {
	            collapse.classList.remove('show');
	        });
	    });	    
	</script> 












</body>
</html>