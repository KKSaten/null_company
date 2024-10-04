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
									<li class="no_dot">공지사항 작성</li>
								</ul>
							</div>
						</div>
						<form action="/notice/write" method="post">
							<div class="card-body">
								<div class="input-group mb-6 custom-write1">
									<span class="input-group-text custom-write2" id="basic-addon3">제목</span>
									<input type="text" class="form-control" id="basic-url"
										name="noticeTitle" aria-describedby="basic-addon3">
								</div>
								<div class="card-body">
									<div class="input-group mb-6 custom-write1">
										<textarea class="form-control custom-write3"
											name="noticeContents" aria-label="With textarea"></textarea>
									</div>
								</div>
							<button type="submit" class="custom-write1 custom-write2">작성 완료</button>
							</div>
						</form>

					</div>
				</div>
			</div>

			<c:import url="../templates/footer.jsp"></c:import>
		</div>
	</div>

	<c:import url="../templates/bootfooter.jsp"></c:import>
</body>
</html>