<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<c:import url="../templates/header.jsp"></c:import>
	<script src="../../resources/js/core/jquery-3.7.1.min.js"></script>

	<title>휴가 신청 내역</title>
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

					<div class="page-header">
						<h3 class="fw-bold mb-3">휴가</h3>
						<ul class="breadcrumbs mb-3">
							<li class="nav-home">
								<a href="#">
									<i class="icon-home"></i>
								</a>
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="#">휴가</a>
							</li>							
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							<li class="nav-item">
								<a href="#">휴가 신청 내역</a>
							</li>
							<li class="separator">
								<i class="icon-arrow-right"></i>
							</li>
							
						</ul>
					</div>



					<div class="row">


						<div class="col-md-12">
							<div class="card">
										<div class="card-header">
											<div class="card-title">휴가 신청 내역</div>
										</div>
										<div class="card-body">
											<table class="table table-hover">
												<thead>
													<tr>
														<th scope="col">이름</th>
														<th scope="col">사번</th>
														<th scope="col">부서</th>
														<th scope="col">직급</th>
														<th scope="col">휴가일</th>
														<th scope="col">휴가 신청일</th>
														<th scope="col">승인</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${list}" var="vo">
													    <tr id="row-${vo.empNum}">
													        <td>${vo.empName}</td>
													        <td>${vo.empNum}</td>
													        <td>${vo.deptName}</td>
													        <td>${vo.posName}</td>
													        <td>${vo.date} (${vo.dating}일)</td>
													        <td>${vo.createdDate}</td>
													        <td>
													            <button id="approve-btn-${vo.empNum}" onclick="approve(${vo.dating}, ${vo.empNum})" style="cursor:pointer;">승인</button>
													        </td>
													    </tr>
													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>
						</div>
					</div>
					
			
				</div> <!-- page-inner -->
			</div> <!-- container -->
			

			<c:import url="../templates/footer.jsp"></c:import>
		</div>
	</div>

	<c:import url="../templates/bootfooter.jsp"></c:import>
	
	<script>
		function approve(dating, empNum) {
		    console.log('approve 함수 호출됨');
		    console.log("승인 요청: dating=" + dating + ", empNum=" + empNum);

		    // 버튼 id 로그 출력
		    const buttonId = "approve-btn-" + empNum;
		    console.log("버튼 id: " + buttonId);

		    if (confirm("승인하시겠습니까?")) {
		        fetch("/vacation/update?dating=" + dating + "&empNum=" + empNum)
		            .then(response => {
		                console.log("Response received:", response);
		                if (response.ok) {
		                    const button = document.getElementById(buttonId);
		                    if (button) {
		                        console.log("Hiding button with empNum: " + empNum);
		                        button.style.display = 'none'; // 버튼 숨기기
		                    } else {
		                        console.error("Error: Button with id " + buttonId + " not found.");
		                    }
		                } else {
		                    alert("승인에 실패했습니다. 다시 시도해주세요.");
		                }
		            })
		            .catch(error => {
		                console.error("Error:", error);
		                alert("승인 중 오류가 발생했습니다.");
		            });
		    }
		}

	</script>

    <script>
      $(document).ready(function () {

        // Add Row
        $("#appr-doc-table").DataTable({
          pageLength: 10,
        });

        var action =
          '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

      });
    </script>
</body>
</html>