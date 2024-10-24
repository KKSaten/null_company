<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:import url="../templates/header.jsp"></c:import>

<title>Document</title>
<script src="/resources/js/core/jquery-3.7.1.min.js"></script>
<script src="/resources/js/plugin/summernote/summernote-lite.js"></script>
<script src="/resources/js/plugin/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/css/summernote-lite.css"/>

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
						<form action="/notice/write" method="post" enctype="multipart/form-data">
							<div class="card-header">
								<div class="card-title custom-list2">
									<ul>
										<li class="no_dot">공지사항 작성</li>
									</ul>
								</div>
								<div class="col-md-11">
									<div class="input-group mb-3 custom-write1 custom-write3">
										<span class="input-group-text" id="basic-addon3">제목</span>
										<input type="text" class="form-control" id="basic-url"
											name="noticeTitle" aria-describedby="basic-addon3">
									</div>
									<div class="input-group mb-6 custom-write1 custom-write3">
										<input type="file" class="form-control" id="attach" name="attaches" multiple>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="card-body">
									<div class="input-group mb-6 custom-write1">
										<textarea class="form-control custom-write3" id="summernote"
											name="noticeContents" aria-label="With textarea"></textarea>
									</div>
								</div>
							<button type="submit" class="custom-write1 custom-write3 btn btn-outline-primary">
							작성 완료</button>
							<a class="custom-write1 btn btn-outline-danger" href="/notice/list">작성 취소</a>
							</div>
						</form>

					</div>
				</div>
			</div>

			<c:import url="../templates/footer.jsp"></c:import>
		</div>
	</div>

	<c:import url="../templates/bootfooter.jsp"></c:import>
	<script src="/resources/js/notice/write.js"></script>
</body>
</html>