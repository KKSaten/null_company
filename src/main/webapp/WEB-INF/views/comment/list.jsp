<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col custom-comment1">
	<c:forEach items="${list}" var="commentVO">
		<hr class="custom-comment1 commentLine">
		<ul class="no_dot custom-comment1">
			<c:choose>
				<c:when test="${commentVO.commentDel eq false }">
					<li class="custom-comment2">이정효 인사팀 ${commentVO.commentDate}
						<a type="button" class="commentMod" data-comment-num="${commentVO.commentNum }">&nbsp; 수정</a>
						<a type="button" class="commentDel" data-comment-num="${commentVO.commentNum }">삭제</a>
						<a type="button" class="replyAdd" data-comment-num="${commentVO.commentNum }">답글</a>
					</li>

					<!-- 댓글 수정 영역 -->
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

				</c:when>
				<c:otherwise>
					<li class="custom-list4">삭제된 글입니다.</li>
				</c:otherwise>
			</c:choose>
		</ul>

		<!-- '답글' 버튼을 클릭했을 때 답글 입력 창을 보여주는 코드 -->
		<c:if test="${targetNum2 eq commentVO.commentNum }">
			<div class="addReplyContentsDiv">
				<textarea class="form-control inputReplys"></textarea>
			</div>
			<br>
			<div class="container text-end">
				<button type="button" class="btn btn-black replySubmit"
					data-comment-num="${commentVO.commentNum }">답글 등록</button>
			</div>
		</c:if>


		<!-- 답글이 있을 때만 보여주는 코드 -->
			<div class="replySection">
				<c:forEach items="${commentVO.replyList}" var="replyVO">
					<c:if test="${replyVO.replyNum ne null}">
						<div class="replyBox">
							<ul class="no_dot custom-comment1">
								<c:choose>
									<c:when test="${replyVO.replyDel eq false }">
										<li class="replyDate">${replyVO.replyDate}
											<a type="button" class="replyMod" data-reply-num="${replyVO.replyNum }">&nbsp; 수정</a>
											<a type="button" class="replyDel" data-reply-num="${replyVO.replyNum }">삭제</a>
										</li>
										
										<c:if test="${targetNum3 eq replyVO.replyNum }">
											<textarea class="form-control reModContents">${replyVO.replyContents }</textarea>
											<br>
											<div class="container text-end">
												<button type="button" class="btn btn-black reModSubmit"
													data-reply-num="${replyVO.replyNum }">수정 완료</button>
											</div>
										</c:if>
										
										<c:if test="${targetNum3 ne replyVO.replyNum }">
											<li class="replyContents">${replyVO.replyContents}</li>
										</c:if>
									</c:when>
									<c:otherwise>
										<li class="custom-list4">삭제된 답글입니다.</li>
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</c:if>
				</c:forEach>
			</div>
	</c:forEach>
</div>
