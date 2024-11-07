<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<c:import url="../templates/header.jsp"></c:import>

	<title>결재 문서 상세</title>
	
	<link rel="stylesheet" href="/resources/css/apprDocDetail.css"/>	
	
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
								<a href="/approval/approvalDocbox">전자결재</a>
							</li>							
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="#">??</a>
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="#">??</a>
							</li>
						</ul>
					</div>



					<div class="row">
					
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="d-flex align-items-center">
										<h4 class="card-title">결재 문서 상세</h4>	
							            																			
									</div>
								</div>
								<div class="card-body">
									<div class="container" style="text-align: center; width: 70%; margin-top: 15px;">
									
										<div class="docContent">
											<table class="table table-bordered">
												<tbody>
												
													<tr class="custom">																												
														<th style="width: 25%;" >
															문서 번호
														</th>
														<td style="width: 25%;">
															${detail.docNum}
														</td>
														<th style="width: 25%;">
															문서 분류
														</th>
														<td style="width: 25%;">
											                ${detail.templateName}
														</td>													
													</tr>												
												
													<tr class="custom">																												
														<th style="width: 25%;" >
															기안자
															<input type="hidden" id="hiddenLoginID" value="${empVO.empNum}">
															<input type="hidden" id="hiddenApprover1" value="${approver1}">
															<input type="hidden" id="hiddenApprover1" value="${approver2}">
															<input type="hidden" id="hiddenApprover1" value="${approver3}">
														</th>
														<td style="width: 25%;">
															${detail.empName}
														</td>
														<th style="width: 25%;">
															소속 부서
														</th>
														<td style="width: 25%;">
											                ${detail.deptName}
														</td>													
													</tr>
													
													<tr class="custom">																												
														<th style="width: 25%;" >
															기안일
														</th>
														<td style="width: 25%;" id="draftDateValue">
															${detail.docDraftdate}
														</td>
														<th style="width: 25%;">
															만료일
														</th>
														<td style="width: 25%;">
											                ${detail.docExpirydate}
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
																					
													<tr>
														<td colspan= 4>
															${docContentText}
														</td>
													</tr>
													
													<tr class="custom">																												
														<th>
															서명
														</th>
														<td colspan= 2>
															<button type="button" class="btn btn-light paramBtn" id="signListModalBtn" data-bs-toggle="modal" data-bs-target="#signListModal">
																서명 선택
															</button>
															<input type="hidden" name="signNum" id="hiddenSignNum">																												
														</td>
														<th>
															<div class="defaultSignDiv">
																<input type="checkbox" id="defaultSign">
																<label for="defaultSign">대표 서명 사용</label>													
															</div>
														</th>
													</tr>
																										
													<tr class="custom">																												
														<th>
															결재선
														</th>
														<td colspan= 3>
															<button type="button" class="btn btn-light paramBtn" id="apprLineBtn" data-bs-toggle="modal" data-bs-target="#apprLineModal">
																결재선 설정
															</button>
															<input type="hidden" name="approver" id="hiddenApprover1">
															<input type="hidden" name="approver" id="hiddenApprover2">
															<input type="hidden" name="approver" id="hiddenApprover3">
														</td>													
													</tr>
													
													<tr class="custom">																												
														<th style="text-align: left;">
															문서 제목
														</th>
														<td colspan= 3 id="docTitleInput">
															<input type="text" placeholder=" 문서 제목을 입력하세요." style="width: 100%; border: 1px solid #eaeaea;" id="docTitle" name="docTitle">
															<input type="hidden" id="hiddenDocWriter" value="${empVO.empNum}" name="docWriter">
															<input type="hidden" id="hiddenDocTypecode" value="${apprDocVO.docTypecode}" name="docTypecode">
															<input type="hidden" id="hiddenDocTemplatecode" value="${apprDocVO.docTemplatecode}" name="docTemplatecode">
														</td>													
													</tr>																										
													
													
												</tbody>
											</table>
										</div>

									</div>								
								</div> <!-- card body -->
																
							</div>
						</div>
						
					</div> <!-- row -->





					<!-- 서명 리스트 모달 -->
					<div class="modal fade" id="signListModal" tabindex="-1" aria-labelledby="signListModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-xl">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="signListModalLabel">서명 선택</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>							
								<div class="modal-body">
	
									<div class="row">
									
										<div class="col-md-12">
											<div class="card">
												<div class="card-header">
													<div class="d-flex align-items-center">
														<h4 class="card-title">서명 관리</h4>	
										                <button class="btn btn-primary ms-auto" id="alert_signature_pad" style="display: none;" onclick="openSignModal()">
										                	서명 추가
										                </button>							            																			
													</div>
												</div>
												<div class="card-body">
													<div class="container" style="text-align: center; width: 90%;">
														<table class="table table-borderless signListTable">
															<tbody>
																<!-- signManager.js 처리 -->
															</tbody>
														</table>
													</div>								
												</div> <!-- card body -->
																				
											</div>
										</div>
										
									</div> <!-- row -->
					        
								</div>
								<div class="modal-footer" style="border:none;">
									<button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" id="submitSign">선택</button>
								</div>
							</div>
						</div>
					</div>					
					
					
					
					
					
					<!-- 서명 작성 모달 -->
					<div class="modal fade" id="signModal" tabindex="-1" aria-labelledby="signModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content signModalBox">
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
	
	
	<script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>
	<script src="/resources/js/approval/signManager.js"></script>

	<script type="text/javascript">
		$('#signListModal').on('shown.bs.modal', function () {
		    updateSignList(); // 서명 목록 업데이트 함수 호출
		});
	</script>

</body>
</html>