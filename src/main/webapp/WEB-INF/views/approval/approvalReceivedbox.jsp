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

	
	<title>수신함</title>
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
								<a href="/approval/approvalReceivedbox">수신함</a>
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="/approval/approvalReceivedbox">??</a>
							</li>
						</ul>
					</div>



					<div class="row">


						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="d-flex align-items-center">
										<h4 class="card-title">수신함</h4>
										<button class="btn btn-light btn-border ms-auto"
											style="border: 1px solid #cccccc;"
											onclick="location.href='/approval/approvalReceivedbox'">
											수신함 전체 문서
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
													<th style="font-size: 15px !important; letter-spacing:0px !important; width: 15%;">기안자</th>
													<th style="font-size: 15px !important; letter-spacing:0px !important; text-align:left !important; width: 13%;">기안일</th>
													<th style="font-size: 15px !important; letter-spacing:0px !important; width: 30%;">결재 처리</th>
												</tr>
											</thead>

											<tbody>										
												<tr>
													<td>
														<!-- if문 사용해서 inProgress-approval 혹은 inProgress-ban을 가지고 있다면 -->
											        	<div class="result-ban">
															<i class="fas fa-times" style="color:#d9534f;"></i>												        
											        	</div>														
													</td>
													<td>
														<div style="font-weight:bold; ">Black Sheep Wall</div>
														<div style="font-size:14px; color:gray; ">휴가신청서</div>
													</td>
													<td>
														<sec:authorize access="isAuthenticated()">
															<sec:authentication property="principal" var="vo" />
															<div class="profile-container" style="display: flex; align-items: center;">
																<!-- 프로필 사진 -->
																<a href="/employee/mypage" class="logo" style="margin-right: 10px;">
																	<img src="/file/employee/${vo.employeeFileVO.fileName}" alt="profile photo"
																	class="navbar-brand" height="50" style="border-radius: 50%;" />
																</a>
																<!-- 이름 및 직급 정보 -->
																<div class="profile-info">
																	<p class="name" style="margin: 0; font-weight: bold;">${vo.empName}</p>
																	<p class="position" style="font-size: 14px; color: gray; margin: 0;">${vo.deptVO.deptName} - ${vo.posVO.posName}</p>
																</div>
															</div>
														</sec:authorize>
													</td>
													<td style="text-align:left !important;"> 2016-07-19 </td>
													<td>
													
													    <div class="approval-line">
													    
													        <div class="approver-group">
													        	<div class="approver-status">
																	<i class="fas fa-pen" style="color:#333;"></i>													        
													        	</div>
													        	<div class="approver">
													        		기안
													        	</div>
													        </div>
													        
													        <div class="approver-group">
													        	<div class="approver-status-inProgress-ban">
																	<i class="fas fa-times" style="color:#d9534f;"></i>												        
													        	</div>
													        	<div class="approver">
													        		이시우
													        	</div>	
													        </div>
													        
													        <div class="approver-group">
													        	<div class="approver-status">
																	<i class="fas fa-circle" style="color:#808080;"></i>											        
													        	</div>
													        	<div class="approver">
													        		고경환
													        	</div>													        
													        </div>
													        
													    </div>														

													</td>

												</tr>
												<tr>
													<td>
											        	<div class="result-approval">
															<i class="fas fa-check" style="color:#5cb85c;"></i>												        
											        	</div>													
													</td>
													<td>
														<div style="font-weight:bold; ">Operation cwal</div>
														<div style="font-size:14px; color:gray; ">출장보고서</div>
													</td>
													<td>
														<div class="profile-container" style="display: flex; align-items: center;">
															<!-- 프로필 사진 -->
															<a href="/employee/mypage" class="logo" style="margin-right: 10px;">
																<img src="../../resources/img/profile.jpg" alt="profile photo"
																class="navbar-brand" height="50" style="border-radius: 50%;" />
															</a>
															<!-- 이름 및 직급 정보 -->
															<div class="profile-info">
																<p class="name" style="margin: 0; font-weight: bold;">김해린</p>
																<p class="position" style="font-size: 14px; color: gray; margin: 0;">인사팀 - 대리</p>
															</div>
														</div>
													</td>
													<td style="text-align:left !important;"> 2018-05-16 </td>
													<td>
													
													    <div class="approval-line">
													    
													        <div class="approver-group">
													        	<div class="approver-status">
																	<i class="fas fa-pen" style="color:#333;"></i>													        
													        	</div>
													        	<div class="approver">
													        		기안
													        	</div>
													        </div>
													        
													        <div class="approver-group">
													        	<div class="approver-status-inProgress-approval">
																	<i class="fas fa-check" style="color:#5cb85c;"></i>												        
													        	</div>
													        	<div class="approver">
													        		고경환
													        	</div>													        
													        </div>
													        
													    </div>														

													</td>

												</tr>												
												<tr>
													<td>
													
													</td>
													<td>
														<div style="font-weight:bold; ">Power Overwhelming</div>
														<div style="font-size:14px; color:gray; ">퇴사신청서</div>
													</td>
													<td>
														<div class="profile-container" style="display: flex; align-items: center;">
															<!-- 프로필 사진 -->
															<a href="/employee/mypage" class="logo" style="margin-right: 10px;">
																<img src="../../resources/img/profile.jpg" alt="profile photo"
																class="navbar-brand" height="50" style="border-radius: 50%;" />
															</a>
															<!-- 이름 및 직급 정보 -->
															<div class="profile-info">
																<p class="name" style="margin: 0; font-weight: bold;">김해린</p>
																<p class="position" style="font-size: 14px; color: gray; margin: 0;">인사팀 - 대리</p>
															</div>
														</div>
													</td>
													<td style="text-align:left !important;"> 2018-05-16 </td>
													<td>
													
													    <div class="approval-line">
													    
													        <div class="approver-group">
													        	<div class="approver-status">
																	<i class="fas fa-pen" style="color:#333;"></i>													        
													        	</div>
													        	<div class="approver">
													        		기안
													        	</div>
													        </div>
													        
													        <div class="approver-group">
													        	<div class="approver-status">
																	<i class="fas fa-check" style="color:#5cb85c;"></i>												        
													        	</div>
													        	<div class="approver">
													        		이정효
													        	</div>													        
													        </div>
													        
													        <div class="approver-group">
													        	<div class="approver-status-inProgress">
																	<i class="fas fa-ellipsis-h" style="color:#0275d8;"></i>											        
													        	</div>
													        	<div class="approver">
													        		이시우
													        	</div>	
													        </div>
													        
													        <div class="approver-group">
													        	<div class="approver-status">
																	<i class="fas fa-circle" style="color:#808080;"></i>											        
													        	</div>
													        	<div class="approver">
													        		고경환
													        	</div>													        
													        </div>
													        
													    </div>														

													</td>

												</tr>
												<tr>
													<td>
											        	<div class="result-ban">
															<i class="fas fa-times" style="color:#d9534f;"></i>												        
											        	</div>													
													</td>
													<td>
														<div style="font-weight:bold; ">Show me the money</div>
														<div style="font-size:14px; color:gray; ">지출결의서</div>
													</td>

													<td>
														<div class="profile-container" style="display: flex; align-items: center;">
															<!-- 프로필 사진 -->
															<a href="/employee/mypage" class="logo" style="margin-right: 10px;">
																<img src="../../resources/img/profile.jpg" alt="profile photo"
																class="navbar-brand" height="50" style="border-radius: 50%;" />
															</a>
															<!-- 이름 및 직급 정보 -->
															<div class="profile-info">
																<p class="name" style="margin: 0; font-weight: bold;">김해린</p>
																<p class="position" style="font-size: 14px; color: gray; margin: 0;">인사팀 - 대리</p>
															</div>
														</div>
													</td>
													<td style="text-align:left !important;"> 2024-10-04 </td>
													<td>
													
													    <div class="approval-line">
													    
													        <div class="approver-group">
													        	<div class="approver-status">
																	<i class="fas fa-pen" style="color:#333;"></i>													        
													        	</div>
													        	<div class="approver">
													        		기안
													        	</div>
													        </div>
													        
													        <div class="approver-group">
													        	<div class="approver-status">
																	<i class="fas fa-check" style="color:#5cb85c;"></i>												        
													        	</div>
													        	<div class="approver">
													        		이정효
													        	</div>													        
													        </div>
													        
													        <div class="approver-group">
													        	<div class="approver-status-inProgress-ban">
																	<i class="fas fa-times" style="color:#d9534f;"></i>												        
													        	</div>
													        	<div class="approver">
													        		이시우
													        	</div>
													        </div>
													        
													        <div class="approver-group">
													        	<div class="approver-status">
																	<i class="fas fa-circle" style="color:#808080;"></i>											        
													        	</div>
													        	<div class="approver">
													        		고경환
													        	</div>														        
													        </div>
													        
													    </div>														

													</td>	
												</tr>

											</tbody>
										</table>
									</div>
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
</body>
</html>