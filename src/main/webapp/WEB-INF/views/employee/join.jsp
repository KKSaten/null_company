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

<style type="text/css">
.blank {
	margin: 0px 0px 15px 0px;
}

.selectgroup-button {
	background-color: white;
	color: #636669;
}

.fas {
	color: #2a2f5b;
}
</style>
<title>Join</title>
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
                			<h1>Join</h1>
                		</div>
						<div class="card-body">
							<h1>사원등록</h1>
							<div class="col-md-6 ms-auto me-auto">
								<form method="post" enctype="multipart/form-data">

									<div class="input-icon blank ">
										<span class="input-icon-addon"> <i
											class="fas fa-id-card-alt"></i>
										</span> <input type="text" class="form-control" id="empId"
											placeholder="사번" name="empId" value="${map.empId}" readonly></input>
									</div>

									<div class="input-icon blank">
										<span class="input-icon-addon"> <i class="fas fa-lock"></i>
										</span> <input type="password" class="form-control" id="empPwd"
											placeholder="비밀번호" name="empPwd" />
									</div>

									<div class="input-icon blank">
										<span class="input-icon-addon"> <i class="fa fa-user"></i>
										</span> <input type="text" class="form-control" id="empName"
											placeholder="이름" name="empName" />
									</div>

									<div class="input-icon blank">
										<span class="input-icon-addon"> <i
											class="fas fa-address-card"></i>
										</span> <input type="text" class="form-control" id="empRegistry"
											placeholder="주민등록번호" name="empRegistry" />
									</div>


									<div class="selectgroup w-100 blank">
										<label class="selectgroup-item"> <input type="radio"
											name="empGender" value="남" class="selectgroup-input" /> <span
											class="selectgroup-button"> <i class="fas fa-male"></i>
												남
										</span>
										</label> <label class="selectgroup-item"> <input type="radio"
											name="empGender" value="여" class="selectgroup-input" /> <span
											class="selectgroup-button"> <i class="fas fa-female"></i>
												여
										</span>
										</label>
									</div>

									<div class="input-icon blank">
										<span class="input-icon-addon"> <i class="fas fa-home"></i>
										</span> <input type="text" class="form-control" id="empAddress"
											placeholder="주소" name="empAddress" />
									</div>

									<select class="form-select blank" name="deptNum"
										style="color: #636669;">
										<option selected="selected" style="font-weight: bolder;">부서</option>
										<c:forEach items="${map.deptList}" var="deptList">
											<option value="${deptList.deptNum}">${deptList.deptName}</option>
										</c:forEach>
									</select> <select class="form-select blank" name="roleNum"
										style="color: #636669;">
										<option selected="selected" style="font-weight: bolder;">직책</option>
										<c:forEach items="${map.roleList}" var="roleList">
											<option value="${roleList.roleNum}">${roleList.roleName}</option>
										</c:forEach>
									</select> <select class="form-select blank" name="posNum"
										style="color: #636669;">
										<option selected="selected" style="font-weight: bolder;">직위</option>
										<c:forEach items="${map.posList}" var="posList">
											<option value="${posList.posNum}">${posList.posName}</option>
										</c:forEach>
									</select>

									<div class="input-icon blank">
										<span class="input-icon-addon"> <i
											class="fas fa-file-image"></i>
										</span> <input style="color: #636669; padding-left: 45px;"
											type="file" class="form-control" id="attach" name="attach" accept="image/*"/>
									</div>

									<button type="submit" class="btn btn-primary">사원 등록</button>
								</form>
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