<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col custom-comment1">
	<c:forEach items="${list}" var="commentVO">
		<ul class="no_dot custom-comment1">
			<c:choose>
				<c:when test="${commentVO.commentDel eq false }">
					<li class="custom-comment2">이정효 인사팀 ${commentVO.commentDate}
						<a type="button" class="commentMod" data-comment-num="${commentVO.commentNum }">&nbsp; 수정</a>
						<a type="button" class="commentDel" data-comment-num="${commentVO.commentNum }">삭제</a>
					</li>
					<li class="custom-comment3">${commentVO.commentContents}</li>
				</c:when>
				<c:otherwise>
					<li class="custom-list4">삭제된 글입니다.</li>
				</c:otherwise>
			</c:choose>
		</ul>	
		<hr class="custom-comment1 commentLine">
	</c:forEach>
</div>