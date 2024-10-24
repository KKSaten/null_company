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


			<!-- 이벤트 클릭시 보여주는 modal, 수정과 삭제 진행 -->
			<div id="detailEventModal" class="modal">
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
						        
						        <!-- '수정은 form 태그를 이용해서 작동하고,
						        '삭제'는 JS에서 a 태그의 href 값을 만들어줘서 작동 -->
						        <!-- 작성자 본인만 수정/삭제가 가능하도록
						        스크립트에 로그인한 사용자 정보를 넘겨주기 위해 input hidden 작성 -->
						        <sec:authorize access="isAuthenticated()">
						        <sec:authentication property="principal" var="loginVO"/>
						        	<input type="hidden" id="loginUser" value="${loginVO.empNum }">
									<button type="submit" id="modifyBtn" class="submitBtn btn btn-warning">수정</button>
									<a href="" id="deleteBtn" class="submitBtn btn btn-danger">삭제</a>
						        </sec:authorize>
				        	</form>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 일정 추가 클릭시 보여주는 modal -->
			<div id="addEventModal" class="modal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-body">
							<form action="/schedule/write" method="POST">			
						        <label for="scheduleTitle2">일정</label>
						        <input type="text" id="scheduleTitle2" name="scheduleTitle">
						        <br>
						
						        <label for="scheduleContents2">내용</label>
						        <input type="text" id="scheduleContents2" name="scheduleContents">
						        <br>
						
						        <label for="scheduleStart2">시작일</label>
						        <input type="date" id="scheduleStart2" name="scheduleStart">
						        <br>
						
						        <label for="scheduleEnd2">종료일</label>
						        <input type="date" id="scheduleEnd2" name="scheduleEnd">
						        <br>
						        
						        <label>카테고리</label>
						        <select class="modal-select" id="scheduleCategory2" name="scheduleCategory">
						        	<option value="연차">연차</option>
						        	<option value="회의">회의</option>
						        	<option value="마감">마감</option>						        
						        	<option value="기타">기타</option>						        
						        </select>
						        <br>
						        
					            <button type="submit" id="addBtn" class="submitBtn btn btn-primary">등록</button>
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