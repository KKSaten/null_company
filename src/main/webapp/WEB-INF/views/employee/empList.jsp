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

<c:import url="../templates/header.jsp"></c:import>
<script src="../../resources/js/core/jquery-3.7.1.min.js"></script>

<title>모든 직원 리스트 (관리자)</title>
</head>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<body>
	<div class="wrapper">
		<div class="main-panel">
			<div class="main-header">
				<c:import url="../templates/sidebar.jsp"></c:import>
				<c:import url="../templates/topbar.jsp"></c:import>
			</div>

			<div class="container">
				<div class="page-inner">

					<div class="page-header">
						<h3 class="fw-bold mb-3">인사 발령</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home"><a href="#"> <i class="icon-home"></i>
							</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">인사 발령</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>
							<li class="nav-item"><a href="#">모든 직원 리스트(관리자)</a></li>
							<li class="separator"><i class="icon-arrow-right"></i></li>

						</ul>
					</div>



					<div class="row">


						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="d-flex align-items-center">
										<h4 class="card-title">모든 직원 리스트(관리자)</h4>
										
									</div>
								</div>
								<div class="card-body">
									<table id="add-row"
										class="display table table-striped table-hover">
										<thead>
											<tr>
												<th scope="col">사원 번호</th>
												<th scope="col">사원 ID</th>
												<th scope="col">사원 이름</th>
												<th scope="col">등록 번호</th>
												<th scope="col">성별</th>
												<th scope="col">주소</th>
												<th scope="col">부서 이름</th>
												<th scope="col">직급 이름</th>
												<th scope="col">직책 이름</th>
												<th scope="col">발령</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list}" var="vo">
												<tr>
													<td>${vo.empNum}</td>
													<td>${vo.empId}</td>
													<td>${vo.empName}</td>
													<td>${vo.empRegistry}</td>
													<td>${vo.empGender}</td>
													<td>${vo.empAddress}</td>
													<td>${vo.deptVO.deptName}</td>
													<td>${vo.posVO.posName}</td>
													<td>${vo.roleVO.roleName}</td>
													<td>
														<button type="button" class="btn btn-primary"
															data-bs-toggle="modal"
															data-bs-target="#modal-${vo.empNum}"
															onclick="setEmployeeDetails('${vo.empNum}', '${vo.empId}', '${vo.empName}', '${vo.empRegistry}', '${vo.empGender}', '${vo.empAddress}', '${vo.deptVO.deptName}', '${vo.posVO.posName}','${vo.roleVO.roleName}')">
															발령</button>
													</td>
												</tr>
												<!-- 각 사원에 대한 모달 -->
												<div class="modal fade" id="modal-${vo.empNum}"
													tabindex="-1" aria-labelledby="modalLabel-${vo.empNum}"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="modalLabel-${vo.empNum}">사원
																	정보 (${vo.empName})</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<p>
																	<strong>사원 번호:</strong> <span
																		id="modalEmpNum-${vo.empNum}">${vo.empNum}</span>
																</p>
																<p>
																	<strong>사원 ID:</strong> <span
																		id="modalEmpId-${vo.empNum}">${vo.empId}</span>
																</p>
																<p>
																	<strong>사원 이름:</strong> <span
																		id="modalEmpName-${vo.empNum}">${vo.empName}</span>
																</p>
															
												
																<p>
																	<strong>부서 이름:</strong> <span
																		id="modalDeptName-${vo.empNum}">${vo.deptVO.deptName}</span>
																</p>
																<p>
																	<strong>직급 이름:</strong> <span
																		id="modalPosName-${vo.empNum}">${vo.posVO.posName}</span>
																</p>
																<p>
																<strong>직책 이름:</strong> <span
																id="modalRoleName-${vo.empNum}">${vo.roleVO.roleName}</span>
																</p>
																<form action="/employee/empListUpdate" method="post"> 								
												<p>
								                    <strong>발령 부서 :</strong> 
													<input type="hidden" name="empNum" value="${vo.empNum}" />
													<input type="hidden" name="prevPosNum" value="${vo.posNum}">
													<input type="hidden" name="prevDepartmentNum" value="${vo.deptNum}">
													<input type="hidden" name="prevRoleNum" value="${vo.roleNum}">
								                    <select id="deptSelect-${vo.empNum}"name="departmentNum" class="form-select">
								                     	
								                        <option value="1" ${vo.deptNum eq 1 ? 'selected' : ''}>인사</option>
								                        <option value="2"${vo.deptNum eq 2 ? 'selected' : ''}>기획</option>
								                        <option value="3"${vo.deptNum eq 3 ? 'selected' : ''}>제작</option>
														<option value="4" ${vo.deptNum eq 4 ? 'selected' : ''}>미디어</option>
														<option value="5" ${vo.deptNum eq 5 ? 'selected' : ''}>영업</option>
														<option value="6" ${vo.deptNum eq 6 ? 'selected' : ''}>경연진</option>
								                        <!-- 추가 부서 옵션 -->
								                    </select>
								                </p>
								                <p>
								                    <strong>발령 직급 :</strong>
										
								                    <select  name="posNum" class="form-select">
								                       
								                        <option value="1" ${vo.posNum eq 1 ? 'selected' : ''}>사원</option>
								                        <option value="2" ${vo.posNum eq 2 ? 'selected' : ''}>대리</option>
								                        <option value="3" ${vo.posNum eq 3 ? 'selected' : ''}>과장</option>
														<option value="6" ${vo.posNum eq 6 ? 'selected' : ''}>차장</option>
														<option value="7" ${vo.posNum eq 7 ? 'selected' : ''}>부장</option>
														<option value="8" ${vo.posNum eq 8 ? 'selected' : ''}>임원</option>
														<option value="9" ${vo.posNum eq 9 ? 'selected' : ''}>사장</option>
								                        <!-- 추가 직급 옵션 -->
								                    </select>
			              						  </p>
												  <strong>발령 직책 :</strong>
												  									
												  	   <select  name="roleNum" class="form-select">
								                       
		  							                        <option value="1" ${vo.roleNum eq 1 ? 'selected' : ''}>부서원</option>
		  							          		       <option value="2" ${vo.roleNum eq 2 ? 'selected' : ''}>부 부서장</option>
		  							                        <option value="3" ${vo.roleNum eq 3 ? 'selected' : ''}>부서장</option>
		  													<option value="4" ${vo.roleNum eq 4 ? 'selected' : ''}>임원</option>
		  													<option value="5" ${vo.roleNum eq 5 ? 'selected' : ''}>사장</option>
		  													<option value="6" ${vo.roleNum eq 6 ? 'selected' : ''}>인사팀원</option>
		  													<option value="7" ${vo.roleNum  eq 7 ? 'selected' : ''}>인사팀장</option>
												  							                        <!-- 추가 직급 옵션 -->
												  							                    </select>
												  		              						  </p>		
																
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">닫기</button>
																<button type="submit" class="btn btn-primary">발령 하기
																	</button>
															</div>
																	</form>
														</div>
													</div>
												</div>
											</c:forEach>
										</tbody>
									</table>


								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

					<c:import url="../templates/footer.jsp"></c:import>
			<c:import url="../templates/bootfooter.jsp"></c:import>
		</div>
	</div>

	<script>
		$(document)
				.ready(
						function() {

							// Add Row
							$("#appr-doc-table").DataTable({
								pageLength : 10,
							});

							var action = '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

						});
	</script>
</body>
</html>