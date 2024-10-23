<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<c:forEach items="${list }" var="noticeVO">
	<ul class="no_dot"
		onclick="location.href='/notice/post?noticeNum=${noticeVO.noticeNum}'">
		<li class="custom-list3"><i class="fas fa-comments"></i>
			${noticeVO.noticeTitle}</li>
		<li class="custom-list4">${noticeVO.departmentVO.deptName}팀,
			${noticeVO.noticeDate}</li>
		<li class="custom-list4"><i class="icon-eye"></i>
			${noticeVO.noticeHit}</li>
	</ul>
	<br>
</c:forEach>


