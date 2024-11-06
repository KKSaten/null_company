<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<c:import url="../templates/header.jsp"></c:import>

	<title>결재 문서 상세</title>
	
	<link rel="stylesheet" href="/resources/css/apprDocDetail.css"/>	
	
</head>
<body>
	<div class="wrapper">
		<div class="main-panel">
			<div class="main-header">
				<c:import url="../templates/sidebar.jsp"></c:import>
				<c:import url="../templates/topbar.jsp"></c:import>
			</div>

			<div class="container">
				<div class="page-inner">

					<div class="page-header mt-3">
						<h3 class="fw-bold mb-1">전자결재</h3>
						<ul class="breadcrumbs mb-1">
							<li class="nav-home">
								<a href="/">
									<i class="icon-home"></i>
								</a>
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="#">전자결재</a>
							</li>							
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="#">??</a>
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="/approval/signaturePad">??</a>
							</li>
						</ul>
					</div>



					<div class="row">
					
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<div class="d-flex align-items-center">
										<h4 class="card-title">결재 문서 상세</h4>	
							            																			
									</div>
								</div>
								<div class="card-body">
									<div class="container" style="text-align: center; width: 90%;">
									
									
									
										<div class="docContent">
											<table class="table table-bordered">
												<tbody>
													<tr>
														<td>
															${docContentText}
														</td>
													</tr>
												</tbody>
											</table>
										</div>




									</div>								
								</div> <!-- card body -->
																
							</div>
						</div>
						
					</div> <!-- row -->






				</div> <!-- page-inner -->
			</div> <!-- container -->

			<c:import url="../templates/footer.jsp"></c:import>
		</div>
	</div>

	<c:import url="../templates/bootfooter.jsp"></c:import>
	
	
	<script src="https://cdn.jsdelivr.net/npm/signature_pad@4.0.0/dist/signature_pad.umd.min.js"></script>
	<script src="/resources/js/approval/signManager.js"></script>

	<script type="text/javascript">
		// 첫 로드 때 서명 리스트 불러오기
		document.addEventListener('DOMContentLoaded', updateSignList);
	</script>

</body>
</html>