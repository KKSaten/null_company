<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<c:import url="../templates/header.jsp"></c:import>
    <title>Document</title>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
    <script src="/resources/js/schedule/calendar.js"></script>
</head>
<body>
	<div class="wrapper">
		<div class="main-panel">
			<c:import url="../templates/sidebar.jsp"></c:import>
			<c:import url="../templates/topbar.jsp"></c:import>


			<!-- 캘린더 가져오는 영역 -->
			<div class="container">
				<div id='calendar'></div>
			</div>

			<c:import url="../templates/footer.jsp"></c:import>
		</div>
	</div>

	<c:import url="../templates/bootfooter.jsp"></c:import>
</body>
</html>