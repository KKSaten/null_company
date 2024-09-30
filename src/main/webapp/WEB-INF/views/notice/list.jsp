<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<c:import url="../tamplates/header.jsp"></c:import>

    <title>Document</title>
</head>
<body>
    <div class="wrapper">
        <div class="main-panel">
            <div class="main-header">
                <c:import url="../tamplates/sidebar.jsp"></c:import>
                <c:import url="../tamplates/topbar.jsp"></c:import>
            </div>

			<div class="container mx-auto p-2" style="width: 1000px;">
				<div class="page inner">
					<div class="">
						<div class="card-header">
							<div class="card-title" style="font-size:60px;">공지 사항</div>
						</div>
						<div class="card-body">
							<table class="table mt-3">
								<tbody>
									<c:forEach items="${list }" var="noticeVO">
										<ul class="no_dot">
											<li style="font-size:48px;">${noticeVO.noticeTitle}</li>
											<li>담당자 : 이정효, ${noticeVO.noticeDate}</li>
											<li>조회수 : ${noticeVO.noticeHit}</li>
										</ul>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>

			<c:import url="../tamplates/footer.jsp"></c:import>
        </div>
    </div>

    <c:import url="../tamplates/bootfooter.jsp"></c:import>
</body>
</html>