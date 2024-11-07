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

.message-container {
	position: relative; /* 자식 요소의 위치를 상대적으로 설정 */
	margin-bottom: 20px; /* 메시지와 시간 사이의 여백 */
}

.message {
	display: flex;
	align-items: center;
	margin: 10px 0;
	max-width: 80%; /* 메시지의 최대 너비 */
	padding: 10px;
	border-radius: 15px;
	position: relative; /* 그림자 효과를 위해 position 속성 추가 */
}

.my-message {
	background-color: #e1ffc7; /* 내 메시지 배경색 (연두색) */
	margin-left: auto; /* 내 메시지는 오른쪽 정렬 */
	border-top-right-radius: 0; /* 오른쪽 위 모서리 둥글지 않게 */
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

.other-message {
	background-color: #f1f1f1; /* 다른 사람의 메시지 배경색 (회색) */
	border-top-left-radius: 0; /* 왼쪽 위 모서리 둥글지 않게 */
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

.read-count {
	font-size: 12px; /* 읽음 수의 글씨 크기 */
	color: #999; /* 읽음 수의 색상 */
	align-self: baseline;
	margin-left: 10px;
	margin-right: 10px;
}

.chat-content {
	display: flex;
	align-items: center; /* 이미지와 텍스트 정렬 */
	max-width: 100%;
}

.rounded-image {
	width: 50px; /* 이미지 너비 */
	height: 50px; /* 이미지 높이 */
	border-radius: 50%; /* 동그란 형태 */
	object-fit: cover; /* 이미지 비율 유지 */
	margin-right: 10px; /* 이미지와 텍스트 간격 */
}

.timestamp {
	bottom: -20px; /* 메시지 박스의 아래쪽으로 나가게 설정 */
	right: 10px; /* 오른쪽에 위치 */
	font-size: 12px; /* 작은 글씨 크기 */
	color: #777; /* 연한 회색 글자 */
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
								<div class="chat-container" id="chatContainer">
									<c:set var="previousItem" value="${null}" />
									<c:forEach items="${vo.chatList}" var="chatVO">
										<c:if test="${chatVO.employeeVO.empNum ne empVO.empNum}">
											<c:if test="${chatVO.employeeVO.empNum ne previousItem}">

												<img
													src="/file/employee/${chatVO.employeeVO.employeeFileVO.fileName}"
													class="rounded-image" alt="Employee Image">
												<strong>${chatVO.employeeVO.empName}</strong>
											</c:if>
										</c:if>
										<div class="message-container">
											<div
												class="message ${chatVO.employeeVO.empNum eq empVO.empNum ? 'my-message' : 'other-message'}"
												style="width: fit-content;">
												<c:choose>
													<c:when test="${chatVO.employeeVO.empNum ne empVO.empNum}">
														<span class="chat-content">
															<p>${chatVO.chatContents}</p>
														</span>
														<span class="read-count">${chatVO.readCount}</span>
													</c:when>
													<c:otherwise>
														<span class="read-count">${chatVO.readCount}</span>
														<span class="chat-content">
															<p>${chatVO.chatContents}</p>
														</span>
													</c:otherwise>
												</c:choose>

											</div>
											<div class="timestamp"
												style="${chatVO.employeeVO.empNum eq empVO.empNum ?'position:absolute;':''}">${chatVO.getFormattedCreateTime()}</div>
										</div>
										<c:set var="previousItem" value="${chatVO.employeeVO.empNum}" />
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
							type="hidden" value="${empVO.empName}" id="empName"><input
							type="hidden" value="${empVO.employeeFileVO.fileName}"
							id="fileName">
						<div class="card-footer">
							<a class="btn btn-secondary" href="list">채팅방 리스트</a>
						</div>
					</div>
				</div>
				<c:import url="../templates/footer.jsp" />
			</div>
		</div>
		<script src="/resources/js/chat/room.js" />
		<c:import url="../templates/bootfooter.jsp"></c:import>
</body>
</html>