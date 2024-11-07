<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<c:import url="../templates/header.jsp"></c:import>
	<c:import url="../templates/datatables.jsp"></c:import>
	
	<link rel="stylesheet" href="/resources/css/apprLine.css" />

	
	<title>결재함</title>
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
								<a href="/approval/approvalDocbox">??</a>
							</li>
						</ul>
					</div>



					<div class="row">


						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="d-flex align-items-center">
										<h4 class="card-title">결재함</h4>
										<button class="btn btn-primary ms-auto" id="alert_select_doc_type" data-bs-toggle="modal" data-bs-target="#docModal">
											기안서 작성
										</button>										
									</div>
								</div>
								<div class="card-body">

									<div class="table-responsive">
										<table id="appr-doc-table" class="table table-striped">
											<thead>
												<tr>
													<th style="width: 2%;" class="approval-result"></th>
													<th style="font-size: 15px !important; letter-spacing:0px !important;">문서 제목</th>
													<th style="font-size: 15px !important; letter-spacing:0px !important; width: 20%;">기안자</th>
													<th style="font-size: 15px !important; letter-spacing:0px !important; text-align:left !important; width: 13%;">기안일</th>
													<th style="font-size: 15px !important; letter-spacing:0px !important; width: 30%;">결재 처리</th>
												</tr>
											</thead>

											<tbody>	
												<c:forEach items="${list}" var="item">	
												
													<tr>
														<td> <!-- 최종 결재 처리 결과 간략히 표시 -->
												        	<c:choose>
												        		<c:when test="${item.approvalResult == '승인'}">
														        	<div class="result-approval">
																		<i class="fas fa-check" style="color:#5cb85c;"></i>												        
														        	</div>
												        		</c:when>
												        		<c:when test="${item.approvalResult == '반려'}">
														        	<div class="result-ban">
																		<i class="fas fa-times" style="color:#d9534f;"></i>												        
														        	</div>
												        		</c:when>
												        		<c:otherwise></c:otherwise>															        																	        		
												        	</c:choose>
														</td>
														
														<td> <!-- 문서 제목, 보고서 유형 -->
															<div style="font-weight:bold; ">${item.docTitle}</div>
															<div style="font-size:14px; color:gray; ">${item.templateName}</div>
														</td>
														
														<td> <!-- 기안자 -->
															<div class="profile-container" style="display: flex; align-items: center;">
																<!-- 프로필 사진 -->
																<div class="avatar"  style="margin-right: 10px;">
																<a href="/employee/detail" class="logo">
																	<img src="/file/employee/${item.fileName}" alt="profile photo" class="avatar-img rounded-circle"/>
																</a>
																</div>
																<!-- 이름 및 직급 정보 -->
																<div class="profile-info">
																	<p class="name" style="margin: 0; font-weight: bold;">${item.empName}</p>
																	<p class="position" style="font-size: 14px; color: gray; margin: 0;">${item.deptName} - ${item.posName}</p>
																</div>
															</div>															
														</td>
														
														<td style="text-align:left !important;"> ${item.docDraftdate} </td> <!-- 기안일 -->
														
														<td> <!-- 결재 라인 정보 -->
														
														    <div class="approval-line">
														    
														        <div class="approver-group">
														        	<div class="approver-status">
																		<i class="fas fa-pen" style="color:#333;"></i>													        
														        	</div>
														        	<div class="approver">
														        		기안
														        	</div>
														        </div>
														        
														    	<c:forEach items="${item.apprLineVO}" var="approver">
														    	
															        <div class="approver-group">
															        	<div class="${approver.apprProgress == '최종승인' ? 'approver-status-inProgress-approval'
															        		: approver.apprProgress == '반려' ? 'approver-status-inProgress-ban'
															        		: approver.apprProgress == '진행' ? 'approver-status-inProgress'
															        		: 'approver-status'}">
																        	<c:choose>
																        		<c:when test="${approver.apprProgress == '승인' || approver.apprProgress == '최종승인'}">
																        			<i class="fas fa-check" style="color:#5cb85c;"></i>
																        		</c:when>
																        		<c:when test="${approver.apprProgress == '반려'}">
																        			<i class="fas fa-times" style="color:#d9534f;"></i>
																        		</c:when>
																        		<c:when test="${approver.apprProgress == '대기'}">
																        			<i class="fas fa-circle" style="color:#808080;"></i>
																        		</c:when>
																        		<c:otherwise>
																        			<i class="fas fa-ellipsis-h" style="color:#0275d8;"></i>
																        		</c:otherwise>															        																	        		
																        	</c:choose>
															        	</div>
															        	<div class="${approver.apprProgress == '최종승인' ? 'approver-inProgress'
															        		: approver.apprProgress == '반려' ? 'approver-inProgress'
															        		: approver.apprProgress == '진행' ? 'approver-inProgress'
															        		: 'approver'}">
															        		${approver.approverName}
															        	</div>	
															        </div>
							
															        
														        </c:forEach>
															        
														        
														    </div>														
	
														</td>
													</tr>
													
												</c:forEach>																			

											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					
			
					
					<!-- 모달 -->
					<div class="modal fade" id="docModal" tabindex="-1" aria-labelledby="docModalLabel" aria-hidden="true">
					    <div class="modal-dialog">
					        <div class="modal-content" style="padding: 10px 30px 10px 30px;">
					            <div class="modal-header" style="border:none; ">
					                <h5 class="modal-title" id="docModalLabel">기안서 작성</h5>
					                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					            </div>
					            <div class="modal-body" style="border : 1px solid #ddd; border-radius:10px; padding: 20px 30px 10px 30px;">
					                <p style="color: #434343; font-weight: 600; margin-bottom: 0;">문서 선택</p>
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
									                        	<div class="template-item" data-template-code="${template.docTemplatecode}" data-type-code="${template.docTypecode}" style="cursor: pointer; color: #555; margin-left: 20px;">
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
					                <button type="button" class="btn btn-primary" id="submitDoc">작성</button>
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
	
	
    <script>
      $(document).ready(function () {

        $("#appr-doc-table").DataTable({
          pageLength: 10,
          order: [[3, 'desc']],
          lengthChange: false,
          columnDefs: [
              { orderable: true, targets: 3, orderSequence: ["desc", "asc"]},
              { orderable: false, targets: [0, 1, 2, 4] }
          ]
        });

        var action =
          '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

      });
    </script>
	    
	<script>

	    let selectedTemplate = null; // 마우스 클릭된 항목
	    let hoveredTemplate = null; // 마우스 오버된 항목
	
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
	        });
	        item.addEventListener('mouseover', function() {
	            // 현재 마우스 오버된 항목 강조
	            hoveredTemplate = this;
	            hoveredTemplate.style.backgroundColor = '#eaeaea';
	        });
	        item.addEventListener('mouseout', function() {
	        	// 마우스 아웃된 항목 강조 해제
	            if (hoveredTemplate === selectedTemplate) {
	                hoveredTemplate.style.backgroundColor = '#e1f3fd'; // 클릭된 항목은 강조 유지
	            } else {
	                hoveredTemplate.style.backgroundColor = '';
	            }
	            hoveredTemplate = null;
	        });
	    });
	
	    // 작성 버튼 클릭 시
	    document.getElementById('submitDoc').addEventListener('click', function() {
	        if (selectedTemplate) {
	            const docTemplatecode = selectedTemplate.getAttribute('data-template-code');
	            const docTypecode = selectedTemplate.getAttribute('data-type-code');
	            location.href = '/approval/write?docTypecode=' + docTypecode + '&docTemplatecode=' + docTemplatecode;
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