<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:import url="../tamplates/header.jsp"></c:import>

<style type="text/css">
.blank {
	margin: 0px 0px 15px 0px;
}

.selectgroup-button {
	background-color: white;
	color:#636669;
}

.fas {
	color:#2a2f5b;
}
</style>
<title>Join</title>
</head>
<body>
	<div class="wrapper">
		<div class="main-panel">
			<div class="main-header">
				<c:import url="../tamplates/sidebar.jsp"></c:import>
				<c:import url="../tamplates/topbar.jsp"></c:import>
			</div>

			<div class="container">
				<div class="page-inner">
					<h1>사원등록</h1>
					<div class="col-md-6 ms-auto me-auto">
						<form method="post">

							<div class="input-icon blank">
								<span class="input-icon-addon"> <i
									class="fas fa-id-card-alt"></i>
								</span> <input type="text" class="form-control" id="empNum"
									placeholder="사번" name="empNum"></input>
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
									class="selectgroup-button">
										<i class="fas fa-male"></i> 남
								</span>
								</label> <label class="selectgroup-item"> <input type="radio"
									name="empGender" value="여" class="selectgroup-input" /> <span
									class="selectgroup-button" >
										<i class="fas fa-female"></i> 여
								</span>
								</label>
							</div>

							<div class="input-icon blank">
								<span class="input-icon-addon"> <i class="fas fa-home"></i>
								</span> <input type="text" class="form-control" id="empAddress"
									placeholder="주소" name="empAddress" />
							</div>

							<select class="form-select blank"
								id="departmentNum" name="departmentNum" style="color:#636669;">
								<option selected="selected">부서<option>
								<option value="0">인사</option>
								<option value="1">개발</option>
							</select>
							
							<select class="form-select blank"
								id="positionNum" name="positionNum" style="color:#636669;">
								<option selected="selected">직책<option>
								<option value="0">사원<option>
								<option value="1">과장</option>
							</select>

							<button type="submit" class="btn btn-primary">사원 등록</button>
						</form>
					</div>

				</div>
			</div>

			<c:import url="../tamplates/footer.jsp"></c:import>
		</div>
	</div>

	<c:import url="../tamplates/bootfooter.jsp"></c:import>
</body>
</html>