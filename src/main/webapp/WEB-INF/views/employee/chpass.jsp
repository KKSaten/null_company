<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<c:import url="../templates/header.jsp"></c:import>

    <title>비밀번호 변경</title>
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
                			<h1>비밀번호 변경</h1>
                		</div>
						<div class="card-body">
							<div class="col-md-6 ms-auto me-auto">
			                  <form method="post">
							  <div class="mb-3">
							    <label for="befpass" class="form-label">변경 전 비밀번호</label>
							    <input type="password" class="form-control" id="befpass" name="befpass">
							  </div>
							  <div class="mb-3">
							    <label for="empPwd" class="form-label">새 비밀번호</label>
							    <input type="password" class="form-control" id="empPwd" name="empPwd">
							  </div>
							  <div class="mb-3">
							    <label for="empPwdCheck" class="form-label">새 비밀번호 확인</label>
							    <input type="password" class="form-control" id="empPwdCheck" name="empPwdCheck">
							  </div>
							  <button type="submit" class="btn btn-primary">변경</button>
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