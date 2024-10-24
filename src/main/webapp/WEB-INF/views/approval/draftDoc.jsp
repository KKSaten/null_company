<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<c:import url="../templates/header.jsp"></c:import>

	<title>기안서 작성</title>
	
	<!-- summernote -->
	<script src="/resources/js/plugin/summernote/summernote-lite.js"></script>
	<script src="/resources/js/plugin/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/css/summernote-lite.css"/>	
	
	<!-- datepicker -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script>
        $(function() {
            // datepicker 초기화
            $("#expiryDate").datepicker({
                dateFormat: "yy-mm-dd" // 날짜 형식 설정
            });
        });
    </script>
    
	<style>
	    .calendar-icon {
	        position: absolute;
	        right: 10px;
	        top: 50%;
	        transform: translateY(-50%);
	        color: #888;
	    }
	    .datepicker-input {
			box-sizing: border-box;
			cursor: pointer;
			border: 1px solid #eaeaea;
	    }
		.table > tbody > tr > td, .table > tbody > tr > th {
			padding: 8px 15px !important;
		}
		.custom > td, .custom > th {
			font-size: 16px !important;
		}
		.summernote {
			text-align: left !important;
		}	    	    
	</style>    

</head>
<body>
	<div class="wrapper">
		<div class="main-panel">
			<div class="main-header">
				<c:import url="../templates/sidebar.jsp"></c:import>
				<c:import url="../templates/topbar.jsp"></c:import>
			</div>

			<div class="container" style="width: 1260px !important;">
				<div class="page-inner">


					<div class="row">

						<div class="col-md-12">
							<div class="card">
							
							
								<div class="card-header">
									<div class="d-flex align-items-center">
										<h4 class="card-title">기안서 작성</h4>																			
									</div>
								</div>
								<div class="card-body">
									<div class="container" style="text-align: center; width: 90%;">
										<table class="table table-bordered">
											<tbody>

												<tr class="custom">																												
													<th style="text-align: left; width: 15%;" >
														기안일
													</th>
													<td style="text-align: left; width: 15%;" id="draftDate">
														<!-- 날짜 -->
													</td>
													<th style="text-align: left; width: 15%;">
														만료일
													</th>
													<td style="text-align: left; width: 15%;">
										                <div class="datepicker-container" style="position: relative; display: inline-block;">
										                    <input type="text" id="expiryDate" class="datepicker-input">
										                    <i class="far fa-calendar-alt calendar-icon"></i>
										                </div>
													</td>													
												</tr>
												<tr class="custom">																												
													<th style="text-align: left;">
														결재선
													</th>
													<td colspan= 3>
														결재선 설정
													</td>													
												</tr>
												<tr class="custom">																												
													<th style="text-align: left;">
														참조 및 참조부서
													</th>
													<td colspan= 2>
														참조자
													</td>
													<td>
														참조부서
													</td>													
												</tr>
												<tr class="custom">																												
													<th style="text-align: left;">
														문서 제목
													</th>
													<td colspan= 3 id="docTitleInput">
														<input type="text" style="width: 100%; border: 1px solid #eaeaea;">
													</td>													
												</tr>
												<tr>
													<td colspan= 4 class="summernote">
														<textarea class="form-control" id="summernote" name="noticeContents" aria-label="With textarea"></textarea>														
													</td>
												</tr>												

											</tbody>
										</table>
									</div>								
								</div>
								
							</div>
						</div>
						
					</div>



				</div>
			</div>

			<c:import url="../templates/footer.jsp"></c:import>
		</div>
	</div>

	<c:import url="../templates/bootfooter.jsp"></c:import>
	<script src="/resources/js/approval/write.js"></script>
	
	<script>
	
	    // 기안일
	    const draftDate = new Date();
	    document.getElementById('draftDate').textContent = draftDate.toISOString().substring(0, 10);	
		
	    //만료일
	    document.addEventListener('DOMContentLoaded', function() {
	        const expiryDate = new Date();
	        expiryDate.setFullYear(today.getFullYear() + 2);
	        document.getElementById('expiryDate').value = expiryDate.toISOString().substring(0, 10);
	    });
	    $(function() {
	        $(".calendar-icon").on("click", function() {
	            $("#expiryDate").datepicker("show");
	        });
	    });	    
	    
	</script>


</body>
</html>