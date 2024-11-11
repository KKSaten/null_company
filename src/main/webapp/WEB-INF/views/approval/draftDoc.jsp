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

	<title>기안서 작성</title>
	
	<!-- summernote -->
	<script src="/resources/js/plugin/summernote/summernote-lite.js"></script>
	<script src="/resources/js/plugin/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/css/summernote-lite.css"/>	
	
	<!-- datepicker -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    
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
								<a href="/approval/approvalDocbox">전자결재</a>
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
						
						
						<form id="draftDocForm" action="/approval/write" method="post">
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
														<td style="width: 25%;" id="draftDateValue">
															<!-- 날짜 -->
														</td>
														<th style="width: 25%;">
															만료일
														</th>
														<td style="width: 25%;">
											                <div class="datepicker-container" style="position: relative; display: inline-block;">
											                    <input type="text" id="expiryDate" class="datepicker-input" name="docExpirydate">
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
															<input type="hidden" id="hiddenLoginID" value="${empVO.empNum}">														
															<input type="hidden" name="approver" id="hiddenApprover1">
															<input type="hidden" name="approver" id="hiddenApprover2">
															<input type="hidden" name="approver" id="hiddenApprover3">
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
													<tr>
														<td colspan= 4>
															
															<div id="docContent">
																<!-- 문서 양식 불러오기 -->
																<c:choose>
																	<c:when test="${apprDocVO.docTypecode == 1}">
																		<jsp:include page="./docTemplates/vacationDraftDoc.jsp"/>
																	</c:when>
																	<c:when test="${apprDocVO.docTypecode == 4}">
																		<jsp:include page="./docTemplates/askForOrders.jsp"/>
																	</c:when>
																</c:choose>
															</div>
															
														</td>
													</tr>
													<tr style="border: none !important;">
														<td colspan= 4 style="border: none !important; padding: 20px 0px 0px 0px !important;">
															<button type="button" class="btn btn-outline-danger cancelBtn" onclick="location.href='/approval/approvalDocbox'">
																작성 취소
															</button>													
															<button type="submit" class="btn btn-primary draftBtn" id="draftBtn">
																상신
															</button>
															<button type="submit" class="btn btn-outline-primary tempBtn" id="tempBtn">
																임시 저장
															</button>													
														</td>
													</tr>
	
												</tbody>
											</table>
										</div>
										
	
										
									</div>
									
								</div> <!-- card -->
							</div>
						</form>
						
					</div>





					<!-- 결재라인 모달 -->
					<div class="modal fade" id="apprLineModal" tabindex="-1" aria-labelledby="apprLineModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-xl">
							<div class="modal-content" style="padding: 10px 30px 10px 30px;">
								<div class="modal-header" style="border:none; ">
									<h5 class="modal-title" id="apprLineModalLabel">결재선 설정</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col-md-5">
											<div class="modalBody1" id="apprLineModalBody1" style="border : 1px solid #ddd; border-radius:10px; padding: 20px 30px 10px 30px; min-height: 360px;">
												<strong style="color: #434343; font-size: 16px; margin-bottom: 0;">사원 검색</strong>
												<p style="color: #bbb; font-size:14px;">결재선에 등록할 사원을 순서대로 선택해주세요</p>
												
												<!-- 검색 창 위치 -->
												<i class="fas fa-search" style="margin-left: 5px; margin-right: 5px; zoom: 1.5; "></i>
												<input type="text" id="searchEmpName" placeholder="사원 검색" style="width: 60%; padding: 8px; margin-bottom: 10px; border: 1px solid #ddd; border-radius: 5px;">
    											
    											
												<ul style="list-style: none; line-height: 185%; margin-top: 15px; margin-left: 5px; padding-left: 5px;">
													<c:forEach items="${deptEmpList}" var="deptList">
													    <li>
													        <a data-bs-toggle="collapse" href="#deptNum_${deptList.deptNum}" style="color: #555; font-size:15px;">
													            <i class="fas fa-caret-down" style="margin-right: 25px;"></i>
													            <i class="fas fa-briefcase" style="margin-right: 5px; zoom: 1.2;"></i>
													            <span>${deptList.deptName}</span>
													        </a>
													        <div class="collapse" id="deptNum_${deptList.deptNum}">
													            <ul style="list-style : none; line-height: 170%;">
													                <c:forEach items="${deptList.employeeVO}" var="empList">
												                        <li>
												                        	<div class="emp-item" style="color: #555; margin-left: 25px;">
												                                <c:choose>
												                                	<c:when test="${empList.empNum != empVO.empNum}">
														                                <i class="fas fa-user" style="margin-right: 5.5px; color: #0275d8; zoom: 1.1;"></i>
												                                	</c:when>
												                                	<c:otherwise>
												                                		<i class="fas fa-user-edit" style="margin-right: 0px; color: #5cb85c; zoom: 1.1;"></i>
												                                	</c:otherwise>
												                                </c:choose>												                        	
												                                <strong class="posName" style="color: #0275d8;">${empList.posName}</strong>
												                                <span class="empName">${empList.empName}</span>
												                                <input class="hiddenEmpNum" type="hidden" value="${empList.empNum}">
												                                <input class="hiddenDeptName" type="hidden" value="${deptList.deptName}">
												                                <input class="hiddenPosNum" type="hidden" value="${empList.posNum}">
												                                
												                                <c:choose>
												                                	<c:when test="${empList.empNum != empVO.empNum}">
													                                	<i class="fas fa-plus approverPlusBtn"></i>
												                                	</c:when>
												                                	<c:otherwise>
												                                	</c:otherwise>
												                                </c:choose>
												                        	</div>
												                        </li>
													                </c:forEach>
													            </ul>
													        </div>
													    </li>
													</c:forEach>																
												</ul>
												
											</div> <!-- modalBody1 -->
										</div>
										
										<div class="col-md-7">
											<div class="modalBody2" id="apprLineModalBody2" style="border : 1px solid #ddd; border-radius:10px; padding: 5px 10px 10px 10px; height: 360px;">
												
												<table class="table table-borderless apprLineTable" style="margin-top: 0px;">
													<thead>
														<tr>
															<th colspan=5 style="font-size: 16px; padding-left: 10px !important; color: #434343; ">
																결재 라인
															</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th style="width: 10%;">
															
															</th>
															<th style="width: 25%;">
																결재자
															</th>
															<th style="width: 15%;">
																직급
															</th>
															<th style="width: 25%;">
																소속
															</th>
															<th style="width: 25%;">
																결재순서
															</th>
														</tr>
														<tr>
															<td>
																<!-- <i class="fas fa-pen" style="zoom: 1.3; margin-left: 10px;"></i> -->
															</td>
															<td>
																${empVO.empName}
																<input id="hiddenDraftEmpNum" type="hidden" value="${empVO.empNum}">
															</td>
															<td>
																${empVO.posVO.posName}
															</td>
															<td>
																${empVO.deptVO.deptName}
															</td>
															<td>
																기안
															</td>
														</tr>
														
														<!-- apprLineManager.js -->

		
													</tbody>
												</table>
												
												
												
																							
											</div> <!-- modalBody2 -->
										</div>										
									</div>
									

					            </div>
					            
								<div class="modal-footer" style="border:none;">
									<button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" id="submitApprLine">저장</button>
								</div>
							</div>
						</div>
					</div>





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





				</div> <!-- page inner -->
			</div>

			<c:import url="../templates/footer.jsp"></c:import>
		</div>
	</div>

	<c:import url="../templates/bootfooter.jsp"></c:import>
	
	<script src="/resources/js/approval/write.js"></script>
	<script src="/resources/js/approval/apprLineManager.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>	
	<script src="/resources/js/approval/signManager.js"></script>
	
	<script src="/resources/js/approval/datePickers.js"></script>
	
	<script type="text/javascript">
		$('#signListModal').on('shown.bs.modal', function () {
		    updateSignList(); // 서명 목록 업데이트 함수 호출
		});
	</script>
	
	<script type="text/javascript">
	    function focusTextarea(tdElement) {
	        const textarea = tdElement.querySelector('textarea');
	        if (textarea) {
	            textarea.focus();
	        }
	    }	
		function autoResize(textarea) {
			textarea.style.height = 'auto'
			textarea.style.height = textarea.scrollHeight + 'px'
		}
	</script>
	
	<script type="text/javascript">
		//input 태그에서 엔터 입력시 submit 이벤트 발생 방지
		document.addEventListener('keydown', function(event) {
			if (event.keyCode === 13) {
				event.preventDefault();
			};
		}, true);	
	</script>
	

</body>
</html>