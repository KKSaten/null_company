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

									<div class="d-flex justify-content-between" style="width: 100%; margin-bottom: 20px; padding: 20px; border: 1px solid #ccc;">
										<h1>서명 리스트</h1>
									</div>
									
									<div class="d-flex justify-content-between" style="width: 100%;">
									    <div>
									        <button class="btn btn-primary" id="alert_signature_pad" data-bs-toggle="modal" data-bs-target="#signModal" >서명 추가</button>
									    </div>
									    <div class="d-flex">
									        <button class="btn btn-border btn-primary ms-2">대표 서명 설정</button>
									        <button class="btn btn-danger ms-2" id="">서명 삭제</button>
									    </div>
									</div>
								</div>
																	
									
									
								</div>
							</div>
						</div>
					</div>




					<!-- 모달 -->
					<div class="modal fade" id="signModal" tabindex="-1" aria-labelledby="signModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="signModalLabel">서명 추가</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>							
								<div class="modal-body">
	
									<div class="container" style="text-align: center; border: 1px solid #ddd; padding: 10px;">
										<div style="margin-top: 10px;">
											<canvas id="signature-pad" width="430px" height="240px"></canvas>
										</div>
										
										<div style="margin-top: 10px; margin-bottom: 5px;">
											<!-- 지우기, 되돌리기-->
											<button class="button" data-action="clear" style="width: 45px; height: 33px; border: 2px solid #ddd; border-radius: 5px;">
												<i class="fas fa-eraser" style="font-size: 18px;"></i>
											</button>
											<button class="button" data-action="undo" style="width: 45px; height: 33px; border: 2px solid #ddd; border-radius: 5px;">
												<i class="fas fa-undo"></i>
											</button>
										</div>
										
									</div>
					        
								</div>
								<div class="modal-footer" style="display: flex; align-items: center; justify-content: space-between;">
									<input type="text" class="form-control" id="signTitle" placeholder="서명 제목을 입력해주세요." style="flex: 1; margin-left: 5px; font-size: 16px;"/>
									<button type="button" class="btn btn-primary" id="saveSignBtn" style="margin-right: 5px; font-size: 16px;">저장</button>
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
	<script type="text/javascript">
		const undoData = [];
		const canvas = document.getElementById("signature-pad");
		const signaturePad = new SignaturePad(canvas, {
			dotSize:2,								// 단일점의 반경, 마크 시작의 너비
			minWidth:2,								// 라인의 최소너비 기본값(0.5)
			maxWidth:4,								// 라인의 최대너비 기본값(2.5)
			penColor: "rgb(43, 43, 43)",			// 펜색상
			backgroundColor: 'rgb(248,248,248)'		// 배경색
		});
	
		// 지우기, 되돌리기 //
		$("button[data-action]").on("click", function() {
			var action = $(this).data("action");
			
			if(action == "clear") {
				signaturePad.clear();
			}
			else if(action == "undo") {
				const data = signaturePad.toData();
				if(data && data.length > 0) {
					const removed = data.pop();
					undoData.push(removed);
					signaturePad.fromData(data);
				}
			}
		});
		
		// 모달창이 닫힐 때 서명 패드 초기화
		$('#signModal').on('hidden.bs.modal', function () {
			signaturePad.clear();
		});	
	
		// 서명 저장 버튼 클릭 이벤트
		document.getElementById('saveSignBtn').addEventListener('click', function() {
		    if (signaturePad.isEmpty()) {
		        alert("서명을 입력해 주세요.");
		        return;
		    }

		    // 서명 PNG 이미지를 Base64로 변환
		    const imgURL = signaturePad.toDataURL('image/png');

		    // FormData 객체 생성
		    const formData = new FormData();
		    
		    // 파라미터 추가
		    formData.append('signatureImage', imgURL);
		    const signTitle = document.getElementById('signTitle').value;
		    formData.append('signTitle', signTitle);

		    // AJAX 요청
		    fetch('/approval/signaturePad', {
		        method: 'POST',
		        body: formData
		    })
		    .then(response => response.json())
		    .then(data => {
		        console.log('성공:', data);
		        // 모달 닫기 및 서명 초기화
		        $('#signModal').modal('hide');
		        signaturePad.clear(); // 서명 패드 초기화
		    })
		    .catch((error) => {
		        console.error('실패:', error);
		    });
		});
	</script>









</body>
</html>