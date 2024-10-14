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
					<!-- c:if 구문은 댓글 수정을 위해 사용 -->
					<c:if test="${targetNum eq commentVO.commentNum }">
						<textarea class="form-control modContents">${commentVO.commentContents }</textarea>
						<br>
						<div class="container text-end">
							<button type="button" class="btn btn-black modSubmit"
								data-comment-num="${commentVO.commentNum }">수정 완료</button>
						</div>
					</c:if>
					<c:if test="${targetNum ne commentVO.commentNum }">
						<li class="custom-comment3">${commentVO.commentContents}</li>
					</c:if>
					<!-- c:if 구문은 댓글 수정을 위해 사용 -->
				</c:when>
				<c:otherwise>
					<li class="custom-list4">삭제된 글입니다.</li>
				</c:otherwise>
			</c:choose>
		</ul>
		
		<!-- 여기부터는 답글 보여주는 코드 -->
		<div>
			<ul>
				<c:forEach items="${commentVO.replyList }" var="replyVO">
					<li class="custom-comment3">${replyVO.replyContents}</li>				
				</c:forEach>
			</ul>
		</div>
		<hr class="custom-comment1 commentLine">
	</c:forEach>
</div>