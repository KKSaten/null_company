<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<c:import url="../templates/header.jsp"></c:import>
	<script src="../../resources/js/core/jquery-3.7.1.min.js"></script>

	<title>휴가 보유/사용현황</title>
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
							<li class="nav-home">
								<a href="#">
									<i class="icon-home"></i>
								</a>
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="#">휴가</a>
							</li>							
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="#">휴가 보유/사용현황</a>
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							
						</ul>
					</div>



					<div class="row">


						<div class="col-md-12">
							<div class="card">
										<div class="card-header">
											<div class="d-flex align-items-center">
										<h4 class="card-title">휴가 보유/사용현황 (변경)</h4>
										
									</div>
										</div>
										<div class="card-body">
											<table class="table table-hover">
												<thead>
													<tr>
														<th scope="col">이름</th>
														<th scope="col">사번</th>
														<th scope="col">부서</th>
														<th scope="col">직급</th>
														<th scope="col">휴가</th>
														<th scope="col">잔여 휴가(수정가능)</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach items="${list}" var="vo">
													<tr>
														<td>${vo.empName}</td>
														<td>${vo.empNum}</td>
														<td>${vo.deptName}</td>
														<td>${vo.posName}</td>
														<td>${vo.date}</td>
															<td>
														<button type="button"  class="btn-two green small"
															data-bs-toggle="modal"
															data-bs-target="#modal-${vo.empNum}">
															${vo.dating}</button>
													</td>
												</tr>
												<!-- 각 사원에 대한 모달 -->
												<div class="modal fade" id="modal-${vo.empNum}"
													tabindex="-1" aria-labelledby="modalLabel-${vo.empNum}"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="modalLabel-${vo.empNum}"> ${vo.empName}님 
																	  (잔여 휴가일 : ${vo.dating}일)</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															  <div class="modal-body">
												                <form id="vacationForm">
												                    <div class="mb-3">
												                        <label for="remainingVacation" class="form-label">잔여 휴가</label>
												                        <input  type="number" value="${vo.dating}" class="form-control" id="remainingVacation" required>
												                    </div>
												                </form>
												            </div>
												            <div class="modal-footer">
												                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
												                <button type="button" class="btn btn-primary" id="saveChangesBtn">변경 저장</button>
												            </div>
														</div>
													</div>
												</div>
													
												</c:forEach>
												</tbody>
											</table>
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

        // Add Row
        $("#appr-doc-table").DataTable({
          pageLength: 10,
        });

        var action =
          '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

      });
    </script>
</body>
</html>