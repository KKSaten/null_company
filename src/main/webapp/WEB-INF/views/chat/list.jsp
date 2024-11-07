<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:import url="../templates/header.jsp"></c:import>

<style>
.allIcon {
	transition: transform 0.1s ease-in-out;
}

.degree {
	transform: rotate(90deg);
}

.circular-image {
	width: 50px; /* 원하는 크기로 조정 */
	height: 50px; /* width와 동일하게 설정 */
	border-radius: 50%; /* 원형으로 만들기 */
	object-fit: cover; /* 이미지가 비율에 맞게 잘림 */
	border: 2px solid #c3e0ff; /* 테두리 추가 (선택 사항) */
}

.roomMemberdiv {
	width: 493px;
	height: 88px;
}

.roomMemberover {
	overflow: auto;
}

.addMemberColor {
	color: blue;
}
</style>
<title>채팅방 리스트</title>
</head>
<body>
	<sec:authentication property="principal" var="vo" />
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
							<h3>검색</h3>
						</div>
						<%-- <form>
							<div class="card-body d-flex justify-content-center">
								<div class="form-group"
									style="width: 28%; align-content: center;">
									<label for="kind" style="display: block; margin-bottom: 5px;">검색</label>
									<div class="input-group">
										<select class="form-select" id="kind" name="kind"
											style="max-width: 120px;">
											<option value="0" selected>분류</option>
											<option value="1">사번</option>
											<option value="2">이름</option>
										</select> <input type="text" class="form-control" id="search"
											placeholder="검색어" aria-label="검색어" style="max-width: 200px;"
											name="search">
										<button class="btn btn-primary" id="searchButton">검색</button>
									</div>
								</div>
								<!-- 부서 검색 -->
								<div class="form-group">
									<label for="deptName">부서</label><select class="form-select"
										id="deptName" name="deptNum">
										<option value="">전체</option>
										<c:forEach items="${deptList}" var="deptList">
											<option value="${deptList.deptNum}">${deptList.deptName}</option>
										</c:forEach>
									</select>
								</div>
								<!-- 재직 여부 -->
								<div class="form-group">
									<label for="enabledFlag">재직 여부</label> <select
										class="form-select" id="enabledFlag" name="enabledFlag">
										<option value="">전체</option>
										<option value="1">재직 중</option>
										<option value="2">퇴직</option>
									</select>
								</div>
							</div>
						</form> --%>
					</div>

					<div class="card">
						<div class="card-header">
							<h1>채팅방 목록</h1>
						</div>

						<div class="card-body d-flex justify-content-center">
							<div class="row row-cols-1">
								<!-- Button trigger modal -->
								<div class="col" align="left">
									<button type="button" class="btn btn-primary"
										data-bs-toggle="modal" data-bs-target="#addModal">새
										채팅</button>
								</div>
								<table
									class="table table-bordered table-hover text-center mt-4 fixed-table">
									<thead>
										<tr>
											<th scope="col">채팅방 번호</th>
											<th scope="col">채팅방 이름</th>
											<th scope="col">참여 인원수</th>
											<th scope="col">최근 메시지 시간</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${roomList}" var="roomList">
											<tr
												onclick="location.href='room?roomNum=${roomList.roomNum}'"
												style="cursor: pointer;">
												<td>${roomList.roomNum}</td>
												<td>${roomList.roomName}</td>
												<td>${fn:length(roomList.roomMember)}</td>
												<td><c:choose>
														<c:when test="${empty roomList.chatList}">
														메세지 없음
													</c:when>
														<c:otherwise>
															<c:forEach var="chatVO" items="${roomList.chatList}"
																varStatus="status">
																<c:if test="${status.last}">
       																${chatVO.createTime}
    															</c:if>
															</c:forEach>
														</c:otherwise>
													</c:choose></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer">
							<%-- <ul class="pagination pg-primary justify-content-center">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Previous"> <span aria-hidden="true">«</span> <span
										class="sr-only">Previous</span></a></li>
								<c:forEach begin="${pager.startPage}" end="${pager.lastPage}"
									step="1" var="i">
									<li class="page-item ${i eq pager.page?'active':''}"><a
										class="page-link" href="list?page=${i}">${i}</a></li>
								</c:forEach>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true">»</span> <span
										class="sr-only">Next</span></a></li>
							</ul> --%>
						</div>
					</div>
				</div>
				<c:import url="../templates/footer.jsp"></c:import>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="addModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">새 채팅</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<h6>채팅방 이름</h6>
						<div class="input-icon blank ">
							<span class="input-icon-addon"> <i class="far fa-comments"></i>
							</span> <input type="text" class="form-control" id="roomName"
								placeholder="채팅방 이름" name="roomName"></input>
						</div>
						<br>
						<h6>대화상대 초대</h6>
						<div id="roomMemberdiv" class="row row-cols-5 my-3"></div>

						<div class="card shadow-none py-3" style="padding-left: 15px;">
							<table>
								<thead>
								</thead>

								<tbody>
									<c:forEach items="${deptList}" var="deptList">
										<tr>
											<td><a data-bs-toggle="collapse"
												href="#collapse${deptList.deptNum}" role="button"
												aria-expanded="false"
												aria-controls="collapse${deptList.deptNum}"
												style="color: black;"
												onclick="chCaret(`${deptList.deptNum}`)"><i
													class="fas fa-caret-right allIcon"
													id="icon${deptList.deptNum}"></i> ${deptList.deptName} </a>

												<div class="collapse" id="collapse${deptList.deptNum}">
													<c:forEach items="${empList}" var="empList">
														<c:if
															test="${deptList.deptNum eq empList.deptNum and empList.empNum ne vo.empNum}">
															<div onclick="manageMember(${empList.empNum})"
																style="cursor: pointer;" id="addMember${empList.empNum}">
																<i class="fas fa-user" id="icon${deptList.deptNum}"
																	style="margin-left: 40px;"></i>
																${empList.roleVO.roleName} ${empList.empName} <br>
															</div>
														</c:if>
													</c:forEach>
												</div></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>


					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-warning"
							data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" id="makeChatBtn">만들기</button>
					</div>
				</div>
			</div>
		</div>
		<script src="/resources/js/chat/list.js"></script>
		<c:import url="../templates/bootfooter.jsp"></c:import>
</body>
</html>