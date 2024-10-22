<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:import url="../templates/header.jsp"></c:import>

<title>상세정보</title>
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
					<div class="row">
						<div class="col-md-6 ms-auto me-auto">
							<div class="card card-profile">
								<div class="card-header"
									style="background-image: url('/file/employee/default/bg_profile.jpg')">
									<div class="profile-picture">
										<div class="avatar avatar-xxl">
											<a data-bs-toggle="modal" data-bs-target="#picModal"> <img
												src="/file/employee/${vo.employeeFileVO.fileName}"
												alt="직원사진" class="avatar-img rounded-circle"
												style="cursor: pointer;" />
											</a>
										</div>
									</div>
								</div>
								<div class="card-body">
									<div class="user-profile text-center">
										<div class="name"
											style="font-size: x-large; font-weight: bold;">사번:
											${vo.empId}</div>
										<div class="name" style="font-size: large;">이름:
											${vo.empName}</div>
										<div class="name" style="font-size: large;">주소:
											${vo.empAddress}</div>
									</div>
									<div class="view-profile" style="margin-top: 30px;">
										<div class="row">
											<div class="col-6">
												<!-- Button trigger modal -->
												<button type="button" class="btn btn-primary w-100"
													data-bs-toggle="modal" data-bs-target="#exampleModal">주소
													수정</button>

											</div>
											<div class="col-6">
												<a href="/employee/chpass" class="btn btn-warning w-100">
													비밀번호 변경</a>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer"></div>
							</div>
						</div>

						<div class="col-md-4 me-auto">
							<div class="row">
								<div class="card card-stats card-round">
									<div class="card-body">
										<div class="row align-items-center">
											<div class="col-icon">
												<div
													class="icon-big text-center icon-primary bubble-shadow-small">
													<i class="fas fa-users"></i>
												</div>
											</div>
											<div class="col col-stats ms-3">
												<div class="numbers">
													<p class="card-category">부서</p>
													<h4 class="card-title">${vo.deptVO.deptName}</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="card card-stats card-round">
									<div class="card-body">
										<div class="row align-items-center">
											<div class="col-icon">
												<div
													class="icon-big text-center icon-primary bubble-shadow-small">
													<i class="fas fa-user-tie"></i>
												</div>
											</div>
											<div class="col col-stats ms-3">
												<div class="numbers">
													<p class="card-category">직책</p>
													<h4 class="card-title">${vo.roleVO.roleName}</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="card card-stats card-round">
									<div class="card-body">
										<div class="row align-items-center">
											<div class="col-icon">
												<div
													class="icon-big text-center icon-primary bubble-shadow-small">
													<i class="fas fa-user-tag"></i>
												</div>
											</div>
											<div class="col col-stats ms-3">
												<div class="numbers">
													<p class="card-category">직위</p>
													<h4 class="card-title">${vo.posVO.posName}</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<c:if test="${vo.roleVO.roleNum eq 7}">
							<a class="btn btn-primary" type="button"
								href="delete?empNum=${vo.empNum}">퇴직 처리</a>
						</c:if>
					</div>
				</div>
			</div>

			<!-- picModal -->
			<div class="modal fade" id="picModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">사진 변경</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<input type="file" id="profileimg" name="attach">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary modalClose"
								data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="picModalSave">저장</button>
						</div>
					</div>
				</div>
			</div>


			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">주소 수정</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="input-icon">
								<input type="text" class="form-control" id="empAddress"
									placeholder="변경 할 주소" name="empAddress" />
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary modalClose"
								data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="addrModalSave">주소
								저장</button>
						</div>
					</div>
				</div>
			</div>


			<c:import url="../templates/footer.jsp"></c:import>
		</div>
	</div>

	<script src="/resources/js/employee/detail.js" />
	<c:import url="../templates/bootfooter.jsp"></c:import>
</body>
</html>