<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:import url="../templates/header.jsp"></c:import>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<style>
body {
	background-color: #f8f9fa;
}

.chat-container {
	height: 70vh;
	overflow-y: auto;
	border: 1px solid #ced4da;
	margin-bottom: 20px;
	padding: 10px;
	background-color: #ffffff;
}

.message {
	margin: 5px 0;
}

.my-message {
	margin-left: auto; /* 오른쪽 정렬 */
	text-align: right; /* 오른쪽 정렬 */
}
</style>

<title>채팅방 리스트</title>
</head>
<body>
	<div class="wrapper">
		<div class="main-panel">
			<div class="main-header">
				<c:import url="../templates/sidebar.jsp"></c:import>
				<c:import url="../templates/topbar.jsp"></c:import>
			</div>
			<sec:authentication property="principal" var="empVO" />
			<div class="container">
				<div class="page-inner">

					<div class="card">
						<div class="card-header">
							<h1>채팅방</h1>
						</div>

						<div class="card-body d-flex justify-content-center">
							<div class="container mt-5">
								<h2 class="text-center">채팅방</h2>
								<div class="chat-container" id="chatContainer">
									<c:forEach items="${roomVO.chatList}" var="chatList">
										<div
											class="message ${chatList.empNum eq empVO.empNum?'my-message':''}">
											<img
												src="/file/employee/${chatList.employeeVO.employeeFileVO.fileName}">
											${chatList.employeeVO.empName} : ${chatList.chatContents}
										</div>
									</c:forEach>
								</div>
								<div class="input-group">
									<input type="text" id="messageInput" class="form-control"
										placeholder="메시지를 입력하세요...">
									<div class="input-group-append">
										<button id="sendButton" class="btn btn-primary">전송</button>
									</div>
								</div>
							</div>
						</div>
						<input type="hidden" value="${vo.roomNum}" id="roomNum"> <input
							type="hidden" value="${empVO.empId}" id="empName">
						<div class="card-footer"></div>
					</div>
				</div>
				<c:import url="../templates/footer.jsp" />
			</div>
		</div>
		<script src="/resources/js/chat/room.js" />
		<c:import url="../templates/bootfooter.jsp"></c:import>
</body>
</html>