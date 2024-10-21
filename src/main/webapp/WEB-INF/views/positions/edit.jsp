<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:import url="../templates/header.jsp"></c:import>

<title>부서 추가</title>
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
							<h1>직책 ${vo eq null?'추가':'수정'}</h1>
						</div>
						<div class="card-body">
							<div class="col-md-6 ms-auto me-auto">
								<form action="${vo eq null?'add':'update'}" method="post">
									<div class="form-floating form-floating-custom mb-3">
										<input type="hidden" name="posNum" value="${vo.posNum}">
										<input type="text" class="form-control" id="deptName"
											placeholder="" name="posName" value="${vo.posName}"/> <label
											for="deptName">직책명</label>
									</div>
									<button class="btn btn-primary">${vo eq null?'추가':'수정'}</button>
								</form>
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