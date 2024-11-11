<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:import url="templates/header.jsp"></c:import>

<title>Index</title>
</head>
<body>
	<div class="wrapper">
		<div class="main-panel">
			<div class="main-header">
				<c:import url="templates/sidebar.jsp"></c:import>
				<c:import url="templates/topbar.jsp"></c:import>
			</div>



			<div class="container">
				<div class="page-inner">
					<div
						class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4">


					</div>
					<div class="row">
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-icon">
											<div
												class="icon-big text-center icon-primary bubble-shadow-small">
												<i class="fas fa-users" id="test"></i>
											</div>
										</div>
										<div class="col col-stats ms-3 ms-sm-0">
											<div class="numbers">
												<p class="card-category">총 사원</p>
												<h4 class="card-title">32 명</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-icon">
											<div
												class="icon-big text-center icon-info bubble-shadow-small">
												<i class="fas fa-user-check" id="close"></i>
											</div>
										</div>
										<div class="col col-stats ms-3 ms-sm-0">
											<div class="numbers">
												<p class="card-category">알림</p>
												<h4 class="card-title">5 건</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-icon">
											<div
												class="icon-big text-center icon-success bubble-shadow-small">
												<i class="fas fa-luggage-cart"></i>
											</div>
										</div>
										<div class="col col-stats ms-3 ms-sm-0">
											<div class="numbers">
												<p class="card-category">잔여 휴가</p>
												<h4 class="card-title">12 일</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-6 col-md-3">
							<div class="card card-stats card-round">
								<div class="card-body">
									<div class="row align-items-center">
										<div class="col-icon">
											<div
												class="icon-big text-center icon-secondary bubble-shadow-small">
												<i class="far fa-check-circle"></i>
											</div>
										</div>
										<div class="col col-stats ms-3 ms-sm-0">
											<div class="numbers">
												<p class="card-category">결제 완료</p>
												<h4 class="card-title">3 건</h4>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-8">
							<div class="card card-round">
								<div class="card-header">
									<div class="card-head-row">
										<div class="card-title">공지사항</div>
									</div>
								</div>
								<div class="card-body">
									<div class="chart-container"
										style="max-height: 375px; min-height: 375px; overflow: auto">
										<div id="indexNotice">
											<!-- 공지사항 미리보기 영역 -->
										</div>
									</div>
									<div id="myChartLegend"></div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card card-round">
								<div class="card-header">
									<div class="card-head-row">
										<div class="card-title">오늘의 일정</div>
									</div>
								</div>
								<div class="card-body">
									<div class="chart-container"
										style="max-height: 375px; min-height: 375px; overflow: auto">
										<div id="indexSchedule">
											<!-- 일정 미리보기 영역 -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card card-round">
								<div class="card-header">
									<div class="card-head-row card-tools-still-right">
										<h4 class="card-title">그룹 채팅방</h4>
										<div class="card-tools">
											<button class="btn btn-icon btn-link btn-primary btn-xs">
												<span class="fa fa-angle-down"></span>
											</button>
											<button
												class="btn btn-icon btn-link btn-primary btn-xs btn-refresh-card">
												<span class="fa fa-sync-alt"></span>
											</button>
											<button class="btn btn-icon btn-link btn-primary btn-xs">
												<span class="fa fa-times"></span>
											</button>
										</div>
									</div>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-md-6">
											<div class="table-responsive table-hover table-sales">
											</div>
										</div>
										<div class="col-md-6">
											<div class="mapcontainer">
												<div id="world-map" class="w-100" style="height: 300px"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script src="/resources/js/notice/preview.js"></script>
			<c:import url="templates/footer.jsp"></c:import>


		</div>
		
	</div>
	<c:import url="templates/bootfooter.jsp"></c:import>
</body>
</html>