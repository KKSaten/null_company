<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div style="border: 1px solid #666; padding: 20px; margin-top: 10px; margin-bottom: 10px;">
	<table class="table table-borderless draftDocumentTemplate">
		<tbody>
		
			<tr>
				<td colspan=11 rowspan=2 class="draftDocumentTemplateTitle"
				style="width: 55%; font-size: 30px; padding-left: 10px !important; color: #333; font-weight: 600;">
					인사 발령 요청서
				</td>
				
				<td colspan=3 style="width: 15%; font-weight: 600;">
					기안자
				</td>
				<td colspan=3 style="width: 15%; font-weight: 600;">
					중간 결재자
				</td>
				<td colspan=3 style="width: 15%; font-weight: 600;">
					최종 결재자
				</td>
			</tr>
			<tr>
				<td colspan=3 style="height: 75px !important; padding: 0px !important;" id="drafterSign">
					
				</td>
				
				<td colspan=3 style="height: 75px !important; padding: 0px !important;" id="midApprSign">
				
				</td>
				
				<td colspan=3 style="height: 75px !important; padding: 0px !important;" id="finApprSign">
				
				</td>
				
			</tr>
			<tr class="hiddenSpace">
				<td style="height: 30px;"><td></td><td></td><td></td><td></td>
				<td></td><td></td><td></td><td></td><td></td>
				<td></td><td></td><td></td><td></td><td></td>
				<td></td><td></td><td></td><td></td><td></td> <!-- 너비 조정용 -->

			</tr>
			<tr>
				<th colspan=3>
					대&nbsp;&nbsp;상&nbsp;&nbsp;자
				</th>
				<td colspan=7>
					${empVO.empName}
				</td>
				<th colspan=3>
					부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서
				</th>
				<td colspan=7>
					${empVO.deptVO.deptName}
				</td>
			</tr>
			<tr>
				<th colspan=3>
					직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;급
				</th>
				<td colspan=7>
					${empVO.posVO.posName}
				</td>
				<th colspan=3>
					직&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;책
				</th>
				<td colspan=7>
					
				</td>
			</tr>
			<tr>
				<th colspan=3>
					발령&nbsp;부서
				</th>
				<td colspan=7 style="height: 30px; padding: 3px !important;">
					<input type="text" style="width: 100%; height: 100%; margin: 3px !important; position: relative; right: 3px; border: none;"	>
				</td>
				<th colspan=3 style="padding-left: 10px !important; padding-right: 10px !important;">
					발령&nbsp;직책
				</th>
				<td colspan=7 style="height: 30px; padding: 3px !important;">
					<input type="text" style="width: 100%; height: 100%; margin: 3px !important; position: relative; right: 3px; border: none;">
				</td>
			</tr>
			<tr>
				<th colspan=3>
					사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;유
				</th>
				<td colspan=17 style="height: 200px; padding: 3px !important;">
					<textarea style="width: 100%; height: 100%; margin: 3px !important; position: relative; top: 3px; right: 3px; border: none;"></textarea>
				</td>
			</tr>
			<tr>
				<th colspan=3>
					발령&nbsp;일자
				</th>
				<td colspan=17 style="height: 30px; padding: 3px !important;">
					<div class="datepicker-container" style="position: relative; display: inline-block;">
	                    <input type="text" id="ordersDate" class="datepicker-input">
	                    <i class="far fa-calendar-alt calendar-icon-ordersDate"></i>
					</div>
				</td>
			</tr>			
			<tr>
				<td colspan=20 style="border: none !important; padding-top: 30px !important;">
					상기와 같이 요청하고자 하오니 허가하여 주시기 바랍니다.
				</td>
			</tr>	
																																		
		</tbody>
	</table>														
</div> <!-- 유형별 기안서 -->