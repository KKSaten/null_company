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
<script src="../../resources/js/core/jquery-3.7.1.min.js"></script>

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

					<div class="page-header">
						<h3 class="fw-bold mb-3">휴가</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"> <i class="icon-home"></i>
							</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">휴가</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">내 휴가</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>

						</ul>
					</div>



					<div class="row">

						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="d-flex align-items-center">
										<h4 class="card-title">내 휴가</h4>
										<div class="ms-auto">
									
										</div>
									</div>
								</div>
								
								<!-- 모달 -->
								<div class="modal fade" id="exampleModal7" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div
											class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">휴가 신청</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
											<form action="/vacation/vacationAdd" method="post"> 
											<h6>📝휴가 일정 입력</h6>
											<input type="date" name="vacationStartDate"></input> ~
											<input type="date" name="vacationEndDate"></input>
											
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-success btn-border"
												data-bs-dismiss="modal">취소</button>
											<button type="submit" class="btn btn-success">휴가
												신청</button>
												</form>

												</div>
											</div>
										</div>
									</div>
									
								<div class="card-body row">
									<!-- Modal -->
			

									<div class="col-sm-6 col-md-3" data-bs-toggle="modal"
										data-bs-target="#exampleModal1">
										<div class="card  card-round">
											<div class="card-header">
												<h1>⛺</h1>
												<div class="card-head-row">

													<div class="card-title">연차</div>
													</div>
													<div>
													<c:forEach items="${list}" var="vo">
													<h6>📝남은 휴가일 : ${vo.vacationLeftoverDate} 일</h6>
										
													</c:forEach>
												</div>
												<div class="card-category">
													<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal7">휴가 신청 하기</button>

												</div>
											</div>

										</div>
									</div>		
										<div class="card-header">
											<div class="card-title">사용 휴가</div>
										</div>
										<div class="card-body">
											<table class="table table-hover">
												<thead>
													<tr>
													
														<th scope="col">휴가 신청일</th>
														<th scope="col">휴가 시작일 ~ 휴가 마감일</th>
														<th scope="col">총 휴가일</th>
														<th scope="col">상태</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${ar}" var="vo">
						                        	<tr>
														<td>${vo.createdDate}</td>
														<td>${vo.date}</td>
														<td>(${vo.dating}일)</td>
														<td></td>
												    </tr>
				                          </c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									

								
											</div>

										</div>
									</div>
								

								
									
		

					</div>
					<c:import url="../templates/footer.jsp"></c:import>
				</div>
			</div>
			<c:import url="../templates/bootfooter.jsp"></c:import>
		</div>
	</div>


	<script src="/resources/js/core/jquery-3.7.1.min.js"></script>
	<script src="/resources/js/core/popper.min.js"></script>
	<script src="/resources/js/core/bootstrap.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script
		src="/resources/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- Datatables -->
	<script src="/resources/js/plugin/datatables/datatables.min.js"></script>
	<!-- Kaiadmin JS -->
	<script src="/resources/js/kaiadmin.min.js"></script>
	<!-- Kaiadmin DEMO methods, don't include it in your project! -->
	<script src="/resources/js/setting-demo2.js"></script>



	<script>
		function handleFormSubmit() {
			// 폼이 제출될 때 이 함수가 실행됩니다.
			// 폼 제출 이후 원하는 페이지로 이동
			setTimeout(() => {
				window.location.href = '/approval/write?docTypecode=1&docTemplatecode=10002';
			}, 100); // 100ms 지연 후 이동
			return true; // 폼 제출을 계속 진행
		}
	</script>

	<script>
		$(document)
				.ready(
						function() {

							// Add Row
							$("#appr-doc-table").DataTable({
								pageLength : 10,
							});

							var action = '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

						});
	</script>
</body>
</html>