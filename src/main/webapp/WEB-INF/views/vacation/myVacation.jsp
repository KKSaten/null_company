S<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
				  <div class="container">
	  <div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<div class="d-flex align-items-center">
								<h4 class="card-title">내 휴가</h4>

							</div>
						</div>
						<div class="card-body row">
							<!-- Modal -->
							
			
							<div class="col-sm-6 col-md-3"  data-bs-toggle="modal" data-bs-target="#exampleModal1">
								<div class="card  card-round">
									<div class="card-header">
										<h1>⛺</h1>
										<div class="card-head-row">
										
											<div class="card-title">연차</div>
											
											<div class="card-tools">
												
											</div>
										</div>
										<div class="card-category">6일</div>
									</div>
									
								</div>
							</div>
							
							<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">⛺연차</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        ...
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-success btn-border" data-bs-dismiss="modal">취소</button>
							        <button type="button" class="btn btn-success">휴가 신청</button>
							      </div>
							    </div>
							  </div>
							</div>
							
							<div class="col-sm-6 col-md-3" data-bs-toggle="modal" data-bs-target="#exampleModal2">
								<div class="card  card-round">
									<div class="card-header">
										<h1>🕓</h1>
										<div class="card-head-row">
										
											<div class="card-title">반차</div>
											
											<div class="card-tools">
												
											</div>
										</div>
										<div class="card-category">6일</div>
									</div>
									
								</div>
							</div>
								<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">🕓반차</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        <h6>📌휴가 정보</h6>
							        
							        <br></br>
							        <h6>📝휴가 일정 입력</h6>
							        	
							      </div>
							      <div class="modal-footer">
							       <button type="button" class="btn btn-success btn-border" data-bs-dismiss="modal">취소</button>
							        <button type="button" class="btn btn-success">휴가 신청</button>
							      </div>
							    </div>
							  </div>
							</div>
							
								<div class="col-sm-6 col-md-3"  data-bs-toggle="modal" data-bs-target="#exampleModal3">
								<div class="card  card-round">
									<div class="card-header">
										<h1>✉️</h1>
										<div class="card-head-row">
										
											<div class="card-title">조의</div>
											
											<div class="card-tools">
												
											</div>
										</div>
										<div class="card-category">6일</div>
									</div>
								</div>
							</div>
								<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">✉️조의</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        ...
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-success btn-border" data-bs-dismiss="modal">취소</button>
							        <button type="button" class="btn btn-success">휴가 신청</button>
							      </div>
							    </div>
							  </div>
							</div>
							
								<div class="col-sm-6 col-md-3"  data-bs-toggle="modal" data-bs-target="#exampleModal4">
								<div class="card  card-round">
									<div class="card-header">
										<h1>💊</h1>
										<div class="card-head-row">
										
											<div class="card-title">병가</div>
											
											<div class="card-tools">
												
											</div>
										</div>
										<div class="card-category">6일</div>
									</div>
									
								</div>
							</div>
						</div>
						
							<div class="modal fade" id="exampleModal4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">💊병가</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        ...
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-success btn-border" data-bs-dismiss="modal">취소</button>
							        <button type="button" class="btn btn-success">휴가 신청</button>
							      </div>
							    </div>
							  </div>
							</div>
							
						<div class="card-body row">
							<!-- Modal -->
							<div class="col-sm-6 col-md-3"  data-bs-toggle="modal" data-bs-target="#exampleModal5">
								<div class="card  card-round">
									<div class="card-header">
										<h1>☀️</h1>
										<div class="card-head-row">
										
											<div class="card-title">여름휴가</div>
											
											<div class="card-tools">
												
											</div>
										</div>
										<div class="card-category">6일</div>
									</div>
									
								</div>
							</div>
							
								<div class="modal fade" id="exampleModal5" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">☀️여름휴가</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        ...
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-success btn-border" data-bs-dismiss="modal">취소</button>
							        <button type="button" class="btn btn-success">휴가 신청</button>
							      </div>
							    </div>
							  </div>
							</div> 
							
							<div class="col-sm-6 col-md-3"  data-bs-toggle="modal" data-bs-target="#exampleModal6">
								<div class="card  card-round">
									<div class="card-header">
										<h1>💍</h1>
										<div class="card-head-row">
										
											<div class="card-title">결혼</div>
											
											<div class="card-tools">
												
											</div>
										</div>
										<div class="card-category">6일</div>
									</div>
									
								</div>
							</div>
							
								<div class="modal fade" id="exampleModal6" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">💍결혼</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        ...
							      </div>
							      <div class="modal-footer">
							       <button type="button" class="btn btn-success btn-border" data-bs-dismiss="modal">취소</button>
							        <button type="button" class="btn btn-success">휴가 신청</button>
							      </div>
							    </div>
							  </div>
							</div>
							
							
								<div class="col-sm-6 col-md-3"  data-bs-toggle="modal" data-bs-target="#exampleModal7">
								<div class="card  card-round">
									<div class="card-header">
										<h1>🚨</h1>
										<div class="card-head-row">
										
											<div class="card-title">긴급</div>
											
											<div class="card-tools">
												
											</div>
										</div>
										<div class="card-category">6일</div>
									</div>
									
								</div>
							</div>
							
								<div class="modal fade" id="exampleModal7" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">🚨긴급</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        ...
							      </div>
							      <div class="modal-footer">
							       <button type="button" class="btn btn-success btn-border" data-bs-dismiss="modal">취소</button>
							        <button type="button" class="btn btn-success">휴가 신청</button>
							      </div>
							    </div>
							  </div>
							</div>
								<div class="col-sm-6 col-md-3"  data-bs-toggle="modal" data-bs-target="#exampleModal8">
								<div class="card  card-round">
									<div class="card-header">
										<h1>✅</h1>
										<div class="card-head-row">
										
											<div class="card-title">기타</div>
											
											<div class="card-tools">
												
											</div>
										</div>
										<div class="card-category">6일</div>
									</div>
									
								</div>
							</div>
							
								<div class="modal fade" id="exampleModal8" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">✅기타</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <div class="modal-body">
							        ...
							      </div>
							      <div class="modal-footer">
							       <button type="button" class="btn btn-success btn-border" data-bs-dismiss="modal">취소</button>
							        <button type="button" class="btn btn-success">휴가 신청</button>
							      </div>
							    </div>
							  </div>
							</div>
							<div class="card">
                  <div class="card-header">
                    <div class="card-title">예정 휴가</div>
                  </div>
                 <div class="card-body">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th scope="col">휴가종류</th>
                          <th scope="col">휴가 시작일</th>
                          <th scope="col">휴가 마감일</th>
                          <th scope="col">상태</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>반차</td>
                          <td>2024.02.13</td>
                          <td>2024.02.16</td>
                          <td>승인</td>
                        </tr>
                       
                      </tbody>
                    </table>
                  </div>
                </div>
                <div class="card">
                  <div class="card-header">
                    <div class="card-title">사용 기록</div>
                  </div>
                  <div class="card-body">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th scope="col">휴가종류</th>
                          <th scope="col">휴가 시작일</th>
                          <th scope="col">휴가 마감일</th>
                          <th scope="col">상태</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>반차</td>
                          <td>2024.02.13</td>
                          <td>2024.02.16</td>
                          <td>승인</td>
                        </tr>
                       
                      </tbody>
                    </table>
                  </div>
                </div>
						</div>
					</div>

					<c:import url="../templates/footer.jsp"></c:import>
        </div>
    </div>
    <c:import url="../templates/bootfooter.jsp"></c:import>
</div>
</div>

	      <script src="/resources/js/core/jquery-3.7.1.min.js"></script>
    <script src="/resources/js/core/popper.min.js"></script>
    <script src="/resources/js/core/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="/resources/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
    <!-- Datatables -->
    <script src="/resources/js/plugin/datatables/datatables.min.js"></script>
    <!-- Kaiadmin JS -->
    <script src="/resources/js/kaiadmin.min.js"></script>
    <!-- Kaiadmin DEMO methods, don't include it in your project! -->
    <script src="/resources/js/setting-demo2.js"></script>
	  
			
		

</body>
</html>