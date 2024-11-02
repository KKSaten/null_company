<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<c:forEach items="${list }" var="scheduleVO">
	<div class="card card-secondary" onclick="location.href='/schedule/calendar'">
		<div class="card-header">
			<div class="card-title"><i class="fa fa-bell"></i>
				${scheduleVO.employeeVO.empName}<br>
				오늘 '${scheduleVO.scheduleTitle}'이 있습니다!
			</div>
		</div>
	</div>
</c:forEach>
