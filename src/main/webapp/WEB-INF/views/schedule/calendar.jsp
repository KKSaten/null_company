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
    <!-- 템플릿과 fullcalendar css 충돌로 인해 최신 버전이 아니라 5.11.5 버전을 사용 -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.5/main.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.5/main.min.css" rel="stylesheet">
    <script src="/resources/js/schedule/calendar.js"></script>
    <link href="../../resources/css/jeonghyo.css" rel="stylesheet"/>
</head>
<body>
	<div class="wrapper">
		<div class="main-panel">
			<c:import url="../templates/sidebar.jsp"></c:import>
			<c:import url="../templates/topbar.jsp"></c:import>



			<!-- 캘린더 상세 이벤트 모달창 -->
			<div id="addEventModal" class="modal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-body">
							<form action="/schedule/modify" method="POST">
						    	<input type="hidden" id="scheduleNum" name="scheduleNum">
						
						        <label for="scheduleTitle">일정</label>
						        <input type="text" id="scheduleTitle" name="scheduleTitle">
						        <br>
						
						        <label for="scheduleContents">내용</label>
						        <input type="text" id="scheduleContents" name="scheduleContents">
						        <br>
						
						        <label for="scheduleStart">시작일</label>
						        <input type="date" id="scheduleStart" name="scheduleStart">
						        <br>
						
						        <label for="scheduleEnd">종료일</label>
						        <input type="date" id="scheduleEnd" name="scheduleEnd">
						        <br>
						        
						        <label>카테고리</label>
						        <select class="modal-select" id="scheduleCategory" name="scheduleCategory">
						        	<option value="연차">연차</option>
						        	<option value="회의">회의</option>
						        	<option value="마감">마감</option>						        
						        	<option value="기타">기타</option>						        
						        </select>
						        <br>
						        	
					            <button type="submit" id="modifyBtn" class="submitBtn btn btn-secondary">수정</button>
				        	</form>
						</div>
					</div>
				</div>
			</div>

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