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

    <title>Login</title>
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
                  <form method="post">
				  <div class="mb-3">
				    <label for="empNum" class="form-label">사번</label>
				    <input type="text" class="form-control" id="empNum" name="empNum">
				  </div>
				  <div class="mb-3">
				    <label for="empPwd" class="form-label">비밀번호</label>
				    <input type="password" class="form-control" id="empPwd" name="empPwd">
				  </div>
				  <div class="mb-3 form-check">
				    <input type="checkbox" name="rememberMe" class="form-check-input" id="rememberMe">
				    <label class="form-check-label" for="rememberMe">Check me out</label>
				  </div>
				  <button type="submit" class="btn btn-primary">Submit</button>
				</form>

                </div>
            </div>

            <c:import url="../templates/footer.jsp"></c:import>
        </div>
    </div>

    <c:import url="../templates/bootfooter.jsp"></c:import>
</body>
</html>