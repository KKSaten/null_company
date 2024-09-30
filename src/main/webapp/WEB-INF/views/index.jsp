<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<c:import url="tamplates/header.jsp"></c:import>

    <title>Document</title>
</head>
<body>
    <div class="wrapper">
        <div class="main-panel">
            <div class="main-header">
                <c:import url="tamplates/sidebar.jsp"></c:import>
                <c:import url="tamplates/topbar.jsp"></c:import>
            </div>

            <div class="container">
                <div class="page inner">

                    //Contents 작성

                </div>
            </div>

            <c:import url="tamplates/footer.jsp"></c:import>
        </div>
    </div>

    <c:import url="tamplates/bootfooter.jsp"></c:import>
</body>
</html>