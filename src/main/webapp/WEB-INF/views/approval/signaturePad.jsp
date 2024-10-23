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
							            <c:if test="${fn:length(signList) < 3}">
							                <button class="btn btn-primary ms-auto" id="alert_signature_pad" data-bs-toggle="modal" data-bs-target="#signModal">
							                	서명 추가
							                </button>
							            </c:if>																			
									</div>
								</div>
								<div class="card-body">
								
					
									<div class="container" style="text-align: center; width: 90%;">
										<table class="table table-borderless">
											<tbody>
												<c:if test="${empty signList}">
													<div style="color:#666; font-size: 18px;">저장한 서명이 없습니다.</div>
												</c:if>
												<c:if test="${not empty signList}">
													<c:forEach items="${signList}" var="sign">
														<tr>																												
															<td style="width: 30%;" >
																<div style="padding: 15px; border: 1px solid #ccc; display: inline-block;">
																	<img src="/file/signature/${sign.signImage}" style="width: 384px; height: 216px;">
																</div>
															</td>
															<td style="text-align: left; width: 15%;">
																<div style="font-size: 18px; font-weight: 600;">${sign.signTitle}</div>
																<div>${sign.signDate}</div>
															</td>
															<td style="text-align: right; width: 30%;">
																<c:choose>
																	<c:when test="${sign.signDefault == 'y'}">
																		<button class="btn btn-border btn-success ms-2" style="background-color: #fff !important;" disabled>
																			<i class="fas fa-check" style="color:#31ce36;"></i>　대표 서명
																		</button>
																	</c:when>
																	<c:otherwise>
																		<button class="btn btn-border btn-primary ms-2" id="setDefaultSign_${sign.signNum}">대표 서명 설정</button>
																	</c:otherwise>
																</c:choose>
																<button class="btn btn-danger ms-2" id="deleteSign_${sign.signNum}">서명 삭제</button>
															</td>
														</tr>
													</c:forEach>
												</c:if>
											</tbody>
										</table>
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
	
	
	<script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>
	<script src="/resources/js/approval/signManager.js"></script>



</body>
</html>