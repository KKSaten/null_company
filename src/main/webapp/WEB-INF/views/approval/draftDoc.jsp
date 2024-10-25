<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<c:import url="../templates/header.jsp"></c:import>

	<title>기안서 작성</title>
	
	<!-- summernote -->
	<script src="/resources/js/plugin/summernote/summernote-lite.js"></script>
	<script src="/resources/js/plugin/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/css/summernote-lite.css"/>	
	
	<!-- datepicker -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script>
        $(function() {
            // datepicker 초기화
            $("#expiryDate").datepicker({
                dateFormat: "yy-mm-dd" // 날짜 형식 설정
            });
        });
    </script>
    
	<link rel="stylesheet" href="/resources/css/draftDoc.css"/>   

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
						<h3 class="fw-bold mb-1">전자결재</h3>
						<ul class="breadcrumbs mb-1">
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
								<a href="/approval/approvalDocbox">결재함</a>
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="/approval/approvalDocbox">기안상신함</a>
							</li>
						</ul>
					</div>

					<div class="row">

						<div class="col-md-12">
							<div class="card">
							
							
								<div class="card-header">
									<div class="d-flex align-items-center">
										<h4 class="card-title">기안서 작성</h4>																			
									</div>
								</div>
								<div class="card-body">
									<div class="container" style="text-align: center; width: 70%; margin-top: 15px;">
										<table class="table table-bordered">
											<tbody>

												<tr class="custom">																												
													<th style="width: 25%;" >
														기안일
													</th>
													<td style="width: 25%;" id="draftDate">
														<!-- 날짜 -->
													</td>
													<th style="width: 25%;">
														만료일
													</th>
													<td style="width: 25%;">
										                <div class="datepicker-container" style="position: relative; display: inline-block;">
										                    <input type="text" id="expiryDate" class="datepicker-input">
										                    <i class="far fa-calendar-alt calendar-icon"></i>
										                </div>
													</td>													
												</tr>
												<tr class="custom">																												
													<th>
														결재선
													</th>
													<td colspan= 3>
														<button type="button" class="btn btn-light paramBtn" id="apprLineBtn" data-bs-toggle="modal" data-bs-target="#apprLineModal">
															결재선 설정
														</button>
													</td>													
												</tr>
												<tr class="custom">																												
													<th>
														참조 및 참조부서
													</th>
													<td colspan= 2>
														<button type="button" class="btn btn-light paramBtn" id="">
															참조자 설정
														</button>
													</td>
													<td>
														<button type="button" class="btn btn-light paramBtn" id="">
															참조 부서 설정
														</button>
													</td>													
												</tr>
												<tr class="custom">																												
													<th>
														서명
													</th>
													<td colspan= 2>
														<button type="button" class="btn btn-light paramBtn" id="">
															서명 선택
														</button>														
													</td>
													<th>
														<div class="defaultSignDiv">
															<input type="checkbox" id="defaultSign">
															<label for="defaultSign">대표 서명 사용</label>													
														</div>
													</th>
												</tr>												
												<tr class="custom">																												
													<th style="text-align: left;">
														문서 제목
													</th>
													<td colspan= 3 id="docTitleInput">
														<input type="text" placeholder=" 문서 제목을 입력하세요."; style="width: 100%; border: 1px solid #eaeaea;">
													</td>													
												</tr>
												<tr>
													<td colspan= 4 class="summernote">
														<textarea class="form-control" id="summernote" name="noticeContents" aria-label="With textarea"></textarea>														
													</td>
												</tr>
												<tr style="border: none !important;">
													<td colspan= 4 style="border: none !important; padding: 20px 0px 0px 0px !important;">
														<button type="button" class="btn btn-outline-danger cancelBtn" onclick="location.href='/approval/approvalDocbox'">
															작성 취소
														</button>													
														<button type="button" class="btn btn-primary draftBtn">
															상신
														</button>
														<button type="button" class="btn btn-outline-primary tempBtn">
															임시 저장
														</button>													
													</td>
												</tr>

											</tbody>
										</table>
									</div>
									

									
								</div>
								
							</div>
						</div>
						
					</div>










					<!-- 모달 -->
					<div class="modal fade" id="apprLineModal" tabindex="-1" aria-labelledby="apprLineModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-xl">
							<div class="modal-content" style="padding: 10px 30px 10px 30px;">
								<div class="modal-header" style="border:none; ">
									<h5 class="modal-title" id="apprLineModalLabel">결재선 설정</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body" style="border : 1px solid #ddd; border-radius:10px; padding: 20px 30px 10px 30px;">
									<p style="color: #434343; font-weight: 600; margin-bottom: 0;">사원 검색</p>
									<p style="color: #bbb; font-size:14px;">작성하실 문서의 유형을 선택해주세요</p>

									<ul style="list-style: none; line-height: 185%; margin-left: 5px; padding-left: 5px;">
										<c:forEach items="${docList}" var="docType">
										    <li>
										        <a data-bs-toggle="collapse" href="#docType_${docType.docTypecode}" style="color: #555; font-size:15px;">
										            <i class="fas fa-caret-down" style="margin-right: 20px;"></i>
										            <i class="fas fa-archive"></i>
										            <span>${docType.docTypename}</span>
										        </a>
										        <div class="collapse" id="docType_${docType.docTypecode}">
										            <ul style="list-style : none; line-height: 170%;">
										                <c:forEach items="${docType.docTemplateVO}" var="template">
									                        <li>
									                        	<div class="template-item" data-template-code="${template.docTemplatecode}" style="cursor: pointer; color: #555; margin-left: 20px;">
									                                <i class="far fa-file-alt"></i>
									                                <span>${template.templateName}</span>
									                        	</div>
									                        </li>
										                </c:forEach>
										            </ul>
										        </div>
										    </li>
										</c:forEach>																
									</ul>

					            </div>
								<div class="modal-footer" style="border:none;">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" id="submitDoc">저장</button>
								</div>
							</div>
						</div>
					</div>










				</div> <!-- page inner -->
			</div>

			<c:import url="../templates/footer.jsp"></c:import>
		</div>
	</div>

	<c:import url="../templates/bootfooter.jsp"></c:import>
	<script src="/resources/js/approval/write.js"></script>
	
	<script>
	
	    // 기안일
	    const draftDate = new Date();
	    document.getElementById('draftDate').textContent = draftDate.toISOString().substring(0, 10);	
		
	    //만료일
	    document.addEventListener('DOMContentLoaded', function() {
	        const expiryDate = new Date();
	        expiryDate.setFullYear(today.getFullYear() + 2);
	        document.getElementById('expiryDate').value = expiryDate.toISOString().substring(0, 10);
	    });
	    $(function() {
	        $(".calendar-icon").on("click", function() {
	            $("#expiryDate").datepicker("show");
	        });
	    });	    
	    
	</script>


</body>
</html>