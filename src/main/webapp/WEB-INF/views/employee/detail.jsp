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

<title>Detail</title>
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
							<h1>직원 상세정보</h1>
						</div>
						<div class="card-body">
							<div class="col-md-6 ms-auto me-auto" >
								<img alt="직원 사진" src="/file/employee/${vo.employeeFileVO.fileName}">
								<h3>${vo.empNum}</h3>
								<h3>${vo.empName}</h3>
								<h3>${vo.empGender}</h3>
								<h3>${vo.empAddress}</h3>
								<h3>
									<c:choose>
										<c:when test="${vo.enabled}">재직 중</c:when>
										<c:otherwise>퇴직</c:otherwise>
									</c:choose>
								</h3>
								
								<a class="btn btn-primary" type="button" href="delete?empNum=${vo.empNum}">퇴직</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<c:import url="../templates/footer.jsp"></c:import>
		</div>
	</div>

	<c:import url="../templates/bootfooter.jsp"></c:import>
</body>
</html>