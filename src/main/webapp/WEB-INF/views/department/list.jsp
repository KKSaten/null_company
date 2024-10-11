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
					<div class="card">
						<div class="card-header">
							<h1>부서 관리</h1>
						</div>
						<div class="card-body">
							<div class="col-md-6 ms-auto me-auto">
								<table class="table mt-4">
									<thead>
										<tr align="center">
											<th scope="col">순번</th>
											<th scope="col">부서 번호</th>
											<th scope="col">부서 이름</th>
											<th scope="col"></th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${list}" var="list" varStatus="status">
											<tr align="center">
												<td>${status.index+1}</td>
												<td>${list.deptNum}</td>
												<td><input type="text" value="${list.deptName} " /></td>
												<td><a href="update?deptNum=${list.deptNum}"><i class="fas fa-edit"/></a></td>
												<td><a href="delete?deptNum=${list.deptNum}"><i class="fas fa-eraser"/></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<a class="btn btn-primary" href="add">추가</a>
							</div>
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