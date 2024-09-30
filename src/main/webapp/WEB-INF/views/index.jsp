<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<c:import url="templates/header.jsp"></c:import>

    <title>Document</title>
</head>
<body>
    <div class="wrapper">
        <div class="main-panel">
            <div class="main-header">
                <c:import url="templates/sidebar.jsp"></c:import>
                <c:import url="templates/topbar.jsp"></c:import>
            </div>

            <div class="container">
                <div class="page inner">

                    //Contents 작성

                </div>
            </div>

            <c:import url="templates/footer.jsp"></c:import>
        </div>
    </div>

    <c:import url="templates/bootfooter.jsp"></c:import>
</body>
</html>