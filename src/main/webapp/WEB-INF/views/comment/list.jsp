<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col custom-comment1">
	<c:forEach items="${list}" var="commentVO">
		<ul class="no_dot custom-comment1">
			<li class="custom-comment2">이정효 인사팀 ${commentVO.commentDate}
				<a>&nbsp; 수정</a>
				<a type="button" class="commentDel" data-comment-del="${commentVO.commentDel }">삭제</a>
			</li>
			<li class="custom-comment3">${commentVO.commentContents}</li>
		</ul>	
		<hr class="custom-comment1 commentLine">
	</c:forEach>
</div>