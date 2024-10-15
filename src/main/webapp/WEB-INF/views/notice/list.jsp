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
</head>
<body>
    <div class="wrapper">
        <div class="main-panel">
            <div class="main-header">
                <c:import url="../templates/sidebar.jsp"></c:import>
                <c:import url="../templates/topbar.jsp"></c:import>
            </div>

			<div class="container custom-list1">
				<div class="page-inner">
					<div class="card">
						<div class="card-header">
							<div class="card-title custom-list2">
								<ul>
									<li class="no_dot">공지사항</li>
								</ul>
							</div>
							<div class="col-lg-2" style="float: right;">
								<div class="form-group form-group-default">
			                        <select class="form-select" id="formGroupDefaultSelect">
			                        	<option>부서 선택</option>
			                        	<c:forEach items="${deptList }" var="deptVO">
				                        	<option value="${deptVO.deptNum }">${deptVO.deptName }</option>
			                        	</c:forEach>	                        	
			                        </select>
	                        	</div>
							</div>
						</div>
						<div class="card-body">
							<table class="table mt-3">
								<tbody>
									<c:forEach items="${list }" var="noticeVO">
										<ul class="no_dot" onclick="location.href='/notice/post?noticeNum=${noticeVO.noticeNum}'">
											<li class="custom-list3"><i class="fas fa-comments"></i> ${noticeVO.noticeTitle}</li>
											<li class="custom-list4">${noticeVO.departmentVO.deptName}팀, ${noticeVO.noticeDate}</li>
											<li class="custom-list4">조회수 ${noticeVO.noticeHit}</li>
										</ul>
										<br><br><br>
									</c:forEach>
								</tbody>
							</table>
							<div class="demo">
								<ul class="pagination pg-black">
									<li class="page-item custom-page1">
										<a class="page-link" href="/notice/list?page=${pager.startPage -1 }" aria-label="Previous">
											<span aria-hidden="true">«</span>
										</a>
									</li>
									
									<c:forEach begin="${pager.startPage }" end="${pager.lastPage }" step="1" var="i">
										<!-- 반복문의 i 값과 현재 page 값이 같으면 버튼을 검은색으로 표시하는 if 문 -->
										<c:choose>
											<c:when test="${i eq pager.page }">
												<li class="page-item active"/>
											</c:when>
											<c:otherwise>
												<li class="page-item"/>
											</c:otherwise>
										</c:choose>
											<a class="page-link" href="/notice/list?page=${i}">${i}</a>
									</c:forEach>
									
									<li class="page-item custom-page2 ${pager.next?'':'disabled' }">
										<a class="page-link" href="/notice/list?page=${pager.lastPage + 1}" aria-label="Next">
											<span aria-hidden="true">»</span>
										</a>
									</li>
								</ul>
							</div>
							<a href="/notice/write">게시글 작성</a>
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