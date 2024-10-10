<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:import url="../templates/header.jsp"></c:import>

<title>MyPage</title>
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
                			<h1>My Page</h1>
                		</div>
						<div class="card-body">
							<div class="col-md-6 ms-auto me-auto">
								<div class="row">
									<div class="col">
										<img alt="직원 사진" src="/file/employee/${vo.employeeFileVO.fileName}" style="width:300px;">
									</div>
									<div class="col"><h3>사번: ${vo.empId}</h3>
										<h3>이름: ${vo.empName}</h3>
										<h3>성별: ${vo.empGender}</h3>
										<h3>주소: ${vo.empAddress}</h3>
									</div>
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
</body>
</html>