<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:import url="../templates/header.jsp"></c:import>
<title>List</title>
<style>
/* 기본 여백 및 간격 조정 */
.form-group {
	margin-bottom: 1rem; /* 아래 여백 추가 */
}

.input-group {
	width: 100%; /* 전체 너비 사용 */
}

.card-body .form-select {
	width: 20px; /* 원하는 너비로 조정 */
	min-width: 20px; /* 최소 너비 설정 */
}
</style>
</head>
<body>
	<div class="wrapper">
		<div class="main-panel">
			<div class="main-header">
				<c:import url="../templates/sidebar.jsp"></c:import>
				<c:import url="../templates/topbar.jsp"></c:import>
			</div>

			<div id="list"></div>

			<div class="container">
				<div class="page-inner">
					<div class="card">
						<div class="card-header">
							<h3>검색</h3>
						</div>
						<div class="card-body d-flex justify-content-center">
							<div class="input-group mb-3">
								<select class="form-select" id="searchType">
									<option value="1" selected>검색</option>
									<option value="2">사번</option>
									<option value="3">이름</option>
								</select> <input type="text" class="form-control" id="searchValue"
									placeholder="검색어" aria-label="검색어">
								<button type="button" class="btn btn-primary" id="searchButton">검색</button>
							</div>
							<!-- 부서 검색 -->
							<div class="form-group">
								<label for="deptName">부서</label> <label for="enabled">재직
									여부</label> <select class="form-select" id="deptName" name="deptNum">
									<option value="">전체</option>
									<c:forEach items="${deptList}" var="deptList">
										<option value="${deptList.deptNum}">${deptList.deptName}</option>
									</c:forEach>
								</select>
							</div>
							<!-- 재직 여부 -->
							<div class="form-group">
								<label for="enabled">재직 여부</label> <select class="form-select"
									id="enabled" name="enabled">
									<option value="">전체</option>
									<option value="true">재직 중</option>
									<option value="false">퇴직</option>
								</select>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-header">
							<h1>사원 목록</h1>
						</div>

						<div class="card-body d-flex justify-content-center">
							<div class="col-md-6">
								<table class="table table-bordered table-hover text-center mt-4">
									<thead>
										<tr>
											<th scope="col">사번</th>
											<th scope="col">이름</th>
											<th scope="col">부서</th>
											<th scope="col">재직여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="list">
											<tr
												onclick="location.href='/employee/detail?empId=${list.empId}'"
												style="cursor: pointer;">
												<td>${list.empId}</td>
												<td>${list.empName}</td>
												<td>${list.deptVO.deptName}</td>
												<td><c:choose>
														<c:when test="${list.enabled}">재직 중</c:when>
														<c:otherwise>퇴직</c:otherwise>
													</c:choose></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer">
							<ul class="pagination pg-primary justify-content-center">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">«</span> <span
										class="sr-only">Previous</span></a></li>
								<c:forEach begin="${pager.startPage}" end="${pager.lastPage}"
									step="1" var="i">
									<li class="page-item ${i eq pager.page?'active':''}"><a
										class="page-link" href="list?page=${i}">${i}</a></li>
								</c:forEach>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">»</span> <span
										class="sr-only">Next</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
		</div>
	</div>

	<c:import url="../templates/bootfooter.jsp"></c:import>
</body>
</html>
