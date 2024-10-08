<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:import url="../templates/header.jsp"></c:import>

<title>List</title>
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
					<div class="card">
						<div class="card-header">
							<h1>부서 관리</h1>
						</div>
						<div class="card-body">
							<div class="col-md-6 ms-auto me-auto">
								<table class="table mt-4">
									<thead>
										<tr>
											<th scope="col">순번</th>
											<th scope="col">부서 번호</th>
											<th scope="col">부서 이름</th>
										</tr>
									</thead>
									<tbody id="tb">
										<c:forEach items="${list}" var="list" varStatus="status">
												<tr style="cursor:pointer;">
													<td>${status.index+1}</td>
													<td>${list.deptNum}</td>
													<td>${list.deptName}</td>
												</tr>
										</c:forEach>
									</tbody>
								</table>
								<a class="btn btn-primary" href="add">추가</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<c:import url="/WEB-INF/views/templates/footer.jsp"></c:import>
		</div>
	</div>

	<c:import url="../templates/bootfooter.jsp"></c:import>
	
	<script>
		const tb = document.getElementById("tb");
	//	const detail = document.getElementsByClassName("detail");

		tb.addEventListener("click",(e)=>{
			console.log(e.target)
		})

		


	// $("#alert_demo_5").click(function (e) {
    //     swal({
    //       title: "Input Something",
    //       html: '<br><input class="form-control" placeholder="Input Something" id="input-field">',
    //       content: {
    //         element: "input",
    //         attributes: {
    //           placeholder: "Input Something",
    //           type: "text",
    //           id: "input-field",
    //           className: "form-control",
    //         },
    //       },
    //       buttons: {
    //         cancel: {
    //           visible: true,
    //           className: "btn btn-danger",
    //         },
    //         confirm: {
    //           className: "btn btn-success",
    //         },
    //       },
    //     }).then(function () {
    //       swal("", "You entered : " + $("#input-field").val(), "success");
    //     });
    //   });
	
	</script>
</body>
</html>