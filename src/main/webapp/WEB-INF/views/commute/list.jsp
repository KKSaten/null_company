<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                      <h4 class="card-title">근태 관리</h4>
                  
                    </div>
                  </div>
                  <div class="card-body">
                    <!-- Modal -->
                    <div
                      class="modal fade"
                      id="addRowModal"
                      tabindex="-1"
                      role="dialog"
                      aria-hidden="true"
                    >
                      
                    </div>

                    <div class="table-responsive">
                      <table
                        id="add-row"
                        class="display table table-striped table-hover"
                      >
                        <thead>
                          <tr>
                          	<th>사원번호</th>
                            <th>사원이름</th>
                            <th>출근시간</th>
                            <th>퇴근시간</th>
                            <th style="width: 10%">출근/퇴근/결근</th>
                          </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${list}" var="vo">
                          <tr>
                            <td>${vo.empNum}</td>
                            <td>${vo.empName}</td>
                            <td>${vo.commuteInTime}</td>
                            <td>${vo.commuteOutTime}</td>
                            <td>${vo.commuteStatus}</td>
                          </tr>
                          </c:forEach>
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
	    <script type="text/javascript">
	    $(document).ready(function () {
	        $("#basic-datatables").DataTable({});

	        $("#multi-filter-select").DataTable({
	          pageLength: 5,
	          initComplete: function () {
	            this.api()
	              .columns()
	              .every(function () {
	                var column = this;
	                var select = $(
	                  '<select class="form-select"><option value=""></option></select>'
	                )
	                  .appendTo($(column.footer()).empty())
	                  .on("change", function () {
	                    var val = $.fn.dataTable.util.escapeRegex($(this).val());

	                    column
	                      .search(val ? "^" + val + "$" : "", true, false)
	                      .draw();
	                  });

	                column
	                  .data()
	                  .unique()
	                  .sort()
	                  .each(function (d, j) {
	                    select.append(
	                      '<option value="' + d + '">' + d + "</option>"
	                    );
	                  });
	              });
	          },
	        });

        $("#add-row").DataTable({
          pageLength: 5,
        });

        var action =
          '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

        $("#addRowButton").click(function () {
          $("#add-row")
            .dataTable()
            .fnAddData([
              $("#addName").val(),
              $("#addPosition").val(),
              $("#addOffice").val(),
              action,
            ]);
          $("#addRowModal").modal("hide");
        });
      });
      </script>
			
			
		

</body>
</html>