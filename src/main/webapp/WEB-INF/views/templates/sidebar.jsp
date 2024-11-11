<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- Sidebar -->
<div class="sidebar" data-background-color="bright">

	<div class="sidebar-logo" style="margin-top: 15px;">
		<!-- Logo Header -->
		<div class="logo-header" data-background-color="bright">
			<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="vo" />
			<div class="profile-container" style="display: flex; align-items: center;">
				<!-- 프로필 사진 -->
				<div class="avatar avatar-xl"  style="margin-right: 10px;">
				<a href="/employee/detail" class="logo">
					<img src="/file/employee/${vo.employeeFileVO.fileName}" alt="profile photo"
					class="avatar-img rounded-circle"/>
				</a>
				</div>
				<!-- 이름 및 직급 정보 -->
				<div class="profile-info">
					<p class="name" style="margin: 0; font-weight: bold;">${vo.empName}</p>
					<p class="position" style="font-size: 14px; color: gray; margin: 0;">${vo.deptVO.deptName} - ${vo.posVO.posName}</p>
				</div>
			</div>
			</sec:authorize>



			<!-- 메뉴 토글 -->
			<div class="nav-toggle"></div>

			<!-- 상단바 토글 -->
			<button class="topbar-toggler more">
				<i class="gg-more-vertical-alt"></i>
			</button>
		</div>
		<!-- End Logo Header -->
	</div>

	<div class="sidebar-wrapper scrollbar scrollbar-inner">
		<div class="sidebar-content">
			<ul class="nav">
				<li class="nav-item">
					<sec:authorize access="isAuthenticated()">
					<!-- 출근 버튼 -->
					<div class="d-grid gap-2 col-12 col-md-8 mx-auto">
						<button id="alert_demo_8" type="submit" class="btn btn-black btn-border" aria-expanded="false">출근하기</button>
						
						<button id="alert_demo_7" type="submit" class="btn btn-black btn-border" aria-expanded="false">퇴근하기</button>
						
						<ul class="dropdown-menu col-12 col-md-8">
							<li></li>

						</ul>
					</div>
					</sec:authorize>
				</li>
				
				<li class="nav-section">
					<span class="sidebar-mini-icon">
						<i class="fa fa-ellipsis-h"></i>
					</span>
					<h4 class="text-section"></h4>
				</li>
				<li class="nav-item">
					<a href="/">
						<i class="fas fa-home"></i>
						<p>홈</p>
					</a>
				</li>
				<li class="nav-item">
					<a  href="/chat/list">
						<i class="fas fa-comments"></i>
						<p>메신저</p>
					</a>
				</li>

				<li class="nav-section">
					<span class="sidebar-mini-icon">
						<i class="fa fa-ellipsis-h"></i>
					</span>
					<h4 class="text-section"></h4>
				</li>


				<li class="nav-item">
					<a href="/notice/list">
						<i class="fas fa-bullhorn"></i>
						<p>공지사항</p>
					</a>
				</li>

				
				<li class="nav-item">
					<a href="/schedule/calendar">
						<i class="far fa-calendar-alt"></i>
						<p>캘린더</p>
					</a>
				</li>
				<li class="nav-item">
					<a data-bs-toggle="collapse" href="#management">
						<i class="fas fa-user-cog"></i>
						<p>조직관리</p>
						<span class="caret"></span>
					</a>
					<div class="collapse" id="management">
						<ul class="nav nav-collapse">
							<li>
								<a href="/employee/list">
									<span class="sub-item">인사관리</span>
								</a>
							</li>
							<li>
								<a href="/department/list">
									<span class="sub-item">부서관리</span>
								</a>
							</li>
							<li>
								<a href="/role/list">
									<span class="sub-item">직책관리</span>
								</a>
							</li>
							<li>
								<a href="/positions/list">
									<span class="sub-item">직위관리</span>
								</a>
							</li>
						</ul>
					</div>
				</li>
				<li class="nav-item">
					<a data-bs-toggle="collapse" href="#commute">
						<i class="fas fa-history"></i>
						<p>근태관리</p>
						<span class="caret"></span>
					</a>
					<div class="collapse" id="commute">
						<ul class="nav nav-collapse">
							<li>
								<a href="/commute/userList">
									<span class="sub-item">근태관리 사용자</span>
								</a>
							</li>
							<li>
								<a href="/commute/list">
									<span class="sub-item">근태관리 관계자</span>
								</a>
							</li>
						</ul>
					</div>
				</li>
				
				
				<li class="nav-item">
					<a data-bs-toggle="collapse" href="#orders">
						<i class="fas fa-exchange-alt"></i>
						<p>인사 발령</p>
						<span class="caret"></span>
					</a>
					<div class="collapse" id="orders">
						<ul class="nav nav-collapse">
							<li>
								<a href="/orders/list">
									<span class="sub-item">인사 발령 관계자</span>
								</a>
							</li>
							<li>
								<a href="/employee/empList">
									<span class="sub-item">모든 직원 리스트 (관계자)</span>
								</a>
							</li>
						</ul>
					</div>
				</li>
				
				<li class="nav-item">
					<a data-bs-toggle="collapse" href="#vacation">
						<i class="fas fa-plane"></i>
						<p>휴가</p>
						<span class="caret"></span>
					</a>
					<div class="collapse" id="vacation">
						<ul class="nav nav-collapse">
							<li>
								<a href="/vacation/myVacation">
									<span class="sub-item">내 휴가</span>
								</a>
							</li>
							<li>
								<a href="/vacation/listDetail">
									<span class="sub-item">휴가 신청내역(관리자)</span>
								</a>
							</li>
							<li>
								<a href="/vacation/list">
									<span class="sub-item">휴가 보유/사용현황(관리자)</span>
								</a>
							</li>
						</ul>
					</div>
				</li>
				
				
				
				
				<li class="nav-item">
					<a data-bs-toggle="collapse" href="#approvals">
						<i class="fas fa-marker"></i>
						<p>전자결재</p>
						<span class="caret"></span>
					</a>
					<div class="collapse" id="approvals">
						<ul class="nav nav-collapse">
							<li>
								<a data-bs-toggle="collapse" href="#approvalBox">
									<span class="col-sm-1"></span>
									<i class="fas fa-file"></i>
									<p>결재함</p>
									<span class="caret"></span>
								</a>
								<div class="collapse" id="approvalBox">
									<ul class="nav nav-collapse subnav">
										<li>
											<a href="../approval/approvalDocbox">
												<span class="col-sm-1"></span>
												<span class="sub-item">기안 상신함</span>
											</a>
										</li>									
										<li>
											<a href="../approval/approvalDocTempStorage">
												<span class="col-sm-1"></span>
												<span class="sub-item">임시 보관함</span>
											</a>
										</li>
										<li>
											<a href="../approval/approvalDocbox">
												<span class="col-sm-1"></span>
												<span class="sub-item">결재 완료함</span>
											</a>
										</li>										
									</ul>
								</div>
							</li>
							
							<li>
								<a data-bs-toggle="collapse" href="#receivedBox">	
									<span class="col-sm-1"></span>								
									<i class="fas fa-archive"></i>
									<p>수신함</p>
									<span class="caret"></span>
								</a>
								<div class="collapse" id="receivedBox">
									<ul class="nav nav-collapse subnav">
										<li>
											<a href="../approval/approvalReceivedbox">
												<span class="col-sm-1"></span>
												<span class="sub-item">참조 문서함</span>
											</a>
										</li>
										<li>
											<a href="../approval/approvalReceivedbox">
												<span class="col-sm-1"></span>
												<span class="sub-item">결재 요청함</span>
											</a>
										</li>
										<li>
											<a href="../approval/approvalReceivedbox">
												<span class="col-sm-1"></span>
												<span class="sub-item">결재 기결함</span>
											</a>
										</li>										
									</ul>
								</div>
							</li>							
							
							<li>
								<a data-bs-toggle="collapse" href="#approvalOption">
									<span class="col-sm-1"></span>
									<i class="fas fa-pen-square"></i>
									<p>결재 관리</p>
									<span class="caret"></span>
								</a>
								<div class="collapse" id="approvalOption">
									<ul class="nav nav-collapse subnav">
										<li>
											<a href="../approval/signaturePad">
												<span class="col-sm-1"></span>
												<span class="sub-item">서명 관리</span>
											</a>
										</li>
										<li>
											<a href="#">
												<span class="col-sm-1"></span>
												<span class="sub-item">미정</span>
											</a>
										</li>										
									</ul>
								</div>
							</li>							


						</ul>
					</div>
				</li>			
				
				
				
				
				
				

			</ul>
		</div>
	</div>
</div>

<script src="/resources/js/commute/commuteCheck.js"></script>