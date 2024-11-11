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
								<c:choose>
									<c:when test="${approver1 == empVO.empNum || approver2 == empVO.empNum || approver3 == empVO.empNum}">
										<a href="/approval/approvalReceivedbox">
											수신함
										</a>
									</c:when>
									<c:otherwise>
										<a href="/approval/approvalDocbox">
											결재함
										</a>
									</c:otherwise>
								</c:choose>	
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<c:choose>
									<c:when test="${approver1 == empVO.empNum || approver2 == empVO.empNum || approver3 == empVO.empNum}">
										<a href="/approval/approvalReceivedbox">
											결재요청함
										</a>
									</c:when>
									<c:otherwise>
										<a href="/approval/approvalDocbox">
											기안상신함
										</a>
									</c:otherwise>
								</c:choose>
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
														<th style="width: 20%;" >
															문서 번호
														</th>
														<td style="width: 30%;" id="docNum">
															${detail.docNum}
														</td>
														<th style="width: 20%;">
															문서 분류
														</th>
														<td style="width: 30%;">
											                ${detail.templateName}
														</td>													
													</tr>												
												
													<tr class="custom">																												
														<th>
															기안자
															<input type="hidden" id="hiddenLoginID" value="${empVO.empNum}">
															<input type="hidden" id="hiddenApprover1" value="${approver1}">
															<input type="hidden" id="hiddenApprover2" value="${approver2}">
															<input type="hidden" id="hiddenApprover3" value="${approver3}">
														</th>
														<td>
															${detail.empName}
														</td>
														<th>
															소속 부서
														</th>
														<td>
											                ${detail.deptName}
														</td>													
													</tr>
													
													<tr class="custom">																												
														<th>
															기안일
														</th>
														<td id="draftDateValue">
															${detail.docDraftdate}
														</td>
														<th>
															만료일
														</th>
														<td>
											                ${detail.docExpirydate}
														</td>													
													</tr>													

													<tr class="custom">																												
														<th>
															결재선
														</th>
														<td colspan= 3 style="text-align: center !important;">
															${approverName1}
															<c:if test="${approverName2 != null}">
																<i class="fas fa-caret-right" style="zoom:1.3; margin-left: 10px; margin-right: 10px; position:relative; top: 1px;"></i>
																${approverName2}
															</c:if>
															<c:if test="${approverName3 != null}">
																<i class="fas fa-caret-right" style="zoom:1.3; margin-left: 10px; margin-right: 10px; position:relative; top: 1px;"></i>
																${approverName3}
															</c:if>																
														</td>													
													</tr>

													<tr class="custom">																												
														<th>
															참조 및 참조부서
														</th>
														<td colspan= 2>
															
														</td>
														<td>
															
														</td>													
													</tr>
													
													<tr class="custom">																												
														<th>
															문서 제목
														</th>
														<td colspan= 3>
															${detail.docTitle}
														</td>													
													</tr>													
													
													<form id="updateApprForm" action="/approval/approval" method="post">
														<tr>
															<td colspan= 4 id="docContentText">
																${docContentText}
															</td>
														</tr>
														
														
														<tr class="custom">
															<th colspan=4 style="border-left: none; border-right: none; height: 50px !important;">
																
															</th>
														</tr>
														<tr class="custom">
															<th colspan=4 style="text-align: center !important; background-color: #eaeaea;">
																결재
															</th>
														</tr>
														<tr class="custom">																												
															<th rowspan=3 style="text-align: left;">
																첨언
															</th>
															<th>
																<c:if test="${approverName1 != null}">
																	${approverName1}
																</c:if>
																<c:if test="${approverName1 == null}">
																	-
																</c:if>																	
															</th>
															<td colspan= 3>
																<c:if test="${apprComment1 != null}">
																	${apprComment1}
																</c:if>
															</td>													
														</tr>
														<tr class="custom">																												
															<th>
																<c:if test="${approverName2 != null}">
																	${approverName2}
																</c:if>
																<c:if test="${approverName2 == null}">
																	-
																</c:if>	
															</th>
															<td colspan= 4>
																<c:if test="${apprComment2 != null}">
																	${apprComment2}
																</c:if>
															</td>													
														</tr>	
														<tr class="custom">																												
															<th>
																<c:if test="${approverName3 != null}">
																	${approverName3}
																</c:if>
																<c:if test="${approverName3 == null}">
																	-
																</c:if>	
															</th>
															<td colspan= 4>
																<c:if test="${apprComment3 != null}">
																	${apprComment3}
																</c:if>
															</td>													
														</tr>
														<c:if test="${(approver1 == empVO.empNum && apprProgress1 == '진행') || (approver2 == empVO.empNum && apprProgress2 == '진행') || (approver3 == empVO.empNum && apprProgress3 == '진행')}">																																													
															<tr class="custom">																												
																<th>
																	서명
																</th>
																<td colspan= 2>
																	<button type="button" class="btn btn-light paramBtn" id="signListModalBtn" data-bs-toggle="modal" data-bs-target="#signListModal">
																		서명 선택
																	</button>
																	<input type="hidden" id="hiddenSignNum">																												
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
																	첨언 첨부
																</th>
																<td colspan= 3>
																	<input type="text" style="width: 100%; border: 1px solid #eaeaea;" id="" name="apprComment">
																	<input type="hidden" id="hiddenDocWriter" value="${empVO.empNum}">
																	<input type="hidden" id="hiddenDocTypecode" value="${apprDocVO.docTypecode}">
																	<input type="hidden" id="hiddenDocTemplatecode" value="${apprDocVO.docTemplatecode}">
																</td>													
															</tr>
															<tr>
																<td colspan=4 style="border-bottom: #fff !important;">
																	<button type="submit" class="btn btn-primary draftBtn" id="apprBtn">
																		승인
																	</button>
																	<button type="submit" class="btn btn-outline-danger tempBtn" id="banBtn">
																		반려
																	</button>																
																</td>
															</tr>																									
														</c:if>
													</form>							
													
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
	
	<script src="/resources/js/approval/approval.js"></script>

	<script type="text/javascript">
		$('#signListModal').on('shown.bs.modal', function () {
		    updateSignList(); // 서명 목록 업데이트 함수 호출
		});
	</script>

</body>
</html>