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
<title>Update</title>
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
							<h1>내 정보 수정</h1>
						</div>
						<div class="card-body">
							<div class="col-md-6 ms-auto me-auto">
								<form method="post" enctype="multipart/form-data">

									<div class="input-icon blank">
										<span class="input-icon-addon"> <i
											class="fas fa-id-card-alt"></i>
										</span> <input type="text" class="form-control" id="empId"
											placeholder="사번" name="empId" value="${vo.empId}" disabled></input>
									</div>

									<div class="input-icon blank">
										<span class="input-icon-addon"> <i class="fa fa-user"></i>
										</span> <input type="text" class="form-control" id="empName"
											placeholder="이름" name="empName" value="${vo.empName}" disabled/>
									</div>

									<div class="input-icon blank">
										<span class="input-icon-addon"> <i
											class="fas fa-address-card"></i>
										</span> <input type="text" class="form-control" id="empRegistry"
											placeholder="주민등록번호" name="empRegistry" value="${vo.empRegistry}" disabled/>
									</div>
									
									<div class="input-icon blank">
										<c:choose>
											<c:when test="${vo.empGender eq '남'}">
												<span class="input-icon-addon"> <i
													class="fas fa-male"></i>
												</span>
												<input type="text" class="form-control" id="empGender"
												name="empGender" value="${vo.empGender}" disabled/>
											</c:when>
											<c:otherwise>
												<span class="input-icon-addon"> <i
													class="fas fa-female"></i>
												</span>
												<input type="text" class="form-control" id="empGender"
												name="empGender" value="${vo.empGender}" disabled/>
											</c:otherwise>
										</c:choose>
									</div>

									<div class="input-icon blank">
										<span class="input-icon-addon"> <i class="fas fa-home"></i>
										</span> <input type="text" class="form-control" id="empAddress"
											placeholder="주소" name="empAddress" value="${vo.empAddress}"/>
									</div>

									<select class="form-select blank" name="deptNum"
										style="color: #636669;">
										<option style="font-weight: bolder;">부서</option>
										<option value="1">본부</option>
										<option value="2">생산</option>
										<option value="3">개발</option>
										<option value="4">영업</option>
										<option value="5">인사</option>
									</select> <select class="form-select blank" name="posNum"
										style="color: #636669;">
										<option selected="selected" style="font-weight: bolder;">직책</option>
										<option value="1">부서원</option>
										<option value="2">부서장</option>
										<option value="3">임원</option>
									</select> <select class="form-select blank" name="roleNum"
										style="color: #636669;">
										<option selected="selected" style="font-weight: bolder;">직위</option>
										<option value="1">사원</option>
										<option value="2">과장</option>
										<option value="3">부장</option>
										<option value="4">관리자</option>
									</select>

									<div class="input-icon blank">
										<span class="input-icon-addon"> <i
											class="fas fa-file-image"></i>
										</span> <input style="color: #636669; padding-left: 45px;"
											type="file" class="form-control" id="attach" name="attach" accept="image/*"/>
									</div>

									<button type="submit" class="btn btn-primary">정보 수정</button>
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