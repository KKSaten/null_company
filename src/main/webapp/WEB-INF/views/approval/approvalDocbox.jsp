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
	
	<title>기안함</title>
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
								<a href="#">
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
								<a href="#">결재함</a>
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="#">추후 수정</a>
							</li>
						</ul>
					</div>



					<div class="row">


						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="d-flex align-items-center">
										<h4 class="card-title">기안 상신함</h4>
										<button class="btn btn-primary btn-round ms-auto">
											기안서 작성
										</button>
									</div>
								</div>
								<div class="card-body">

									<div class="table-responsive">
										<table id="appr-doc-table" class="table table-striped">
											<thead>
												<tr>
													<th style="font-size: 15px !important; letter-spacing:0px !important; width: 10%;">결재 유형</th>
													<th style="font-size: 15px !important; letter-spacing:0px !important;">문서 제목</th>
													<th style="font-size: 15px !important; letter-spacing:0px !important; width: 25%;">기안자</th>
													<th style="font-size: 15px !important; letter-spacing:0px !important; width: 20%;">기안일(수정일)</th>
													<th style="font-size: 15px !important; letter-spacing:0px !important; width: 10%;">결재 처리</th>
												</tr>
											</thead>

											<tbody>										
												<tr>
													<td>휴가신청서</td>
													<td>System Architect</td>
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
													<td> - </td>
													<td>
													
														<div class="form-button-action">
															<button type="button" data-bs-toggle="tooltip" title=""
																class="btn btn-lg btn-link btn-danger"
																style="font-size:50px;">
																<i class="fas fa-ban"></i>
															</button>														
														</div>
														
													</td>
												</tr>
												<tr>
													<td>출장</td>
													<td>Accountant</td>
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
													<td> - </td>
													<td>
													
														<div class="form-button-action">
															<button type="button" data-bs-toggle="tooltip" title=""
																class="btn btn-lg btn-link btn-success"
																style="font-size:50px;">
																<i class="far fa-check-circle"></i>
															</button>															
														</div>
														
													</td>
												</tr>
												<tr>
													<td>퇴사</td>
													<td>Junior Technical Author</td>
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
													<td> - </td>
													<td>
													
														<div class="form-button-action">
															<button type="button" data-bs-toggle="tooltip" title=""
																class="btn btn-lg btn-link btn-primary"
																style="font-size:50px;">
																<i class="far fa-edit"></i>
															</button>
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
              { orderable: false, targets: [0, 1, 2, 4] }
          ]
        });

        var action =
          '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

      });
    </script>
</body>
</html>