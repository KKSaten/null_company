<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div style="border: 1px solid #666; padding: 20px; margin-top: 10px; margin-bottom: 10px;">
	<table class="table table-borderless draftDocumentTemplate">
		<tbody>
		
			<tr>
				<td colspan=11 rowspan=2 class="draftDocumentTemplateTitle"
				style="width: 55%; font-size: 30px; padding-left: 10px !important; color: #333; font-weight: 600;">
					연차 휴가신청서
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
					신&nbsp;&nbsp;청&nbsp;&nbsp;자
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
					${empVO.roleVO.roleName}
				</td>
			</tr>
			<tr>
				<th colspan=3>
					휴가&nbsp;기간
				</th>
				<td colspan=12>
					<div>
		                <div class="datepicker-container" style="position: relative; display: inline-block;">
		                    <input type="text" id="vacationStart" class="datepicker-input inputValue">
		                    <i class="far fa-calendar-alt calendar-icon-vacSt"></i>
		                </div>																			
		                    <span style="font-size: 20px;">&nbsp;~&nbsp;</span>
						<div class="datepicker-container" style="position: relative; display: inline-block;">
		                    <input type="text" id="vacationEnd" class="datepicker-input inputValue">
		                    <i class="far fa-calendar-alt calendar-icon-vacEnd"></i>
						</div>
					</div>
				</td>
				<th colspan=3 style="padding-left: 10px !important; padding-right: 10px !important;">
					사용&nbsp;연차
				</th>
				<td colspan=2 id="dayDifference">
					
				</td>
			</tr>
			<tr>
				<th colspan=3>
					사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;유
				</th>
				<td colspan=17 style="height: 200px; padding: 10px !important;" onclick="focusTextarea(this)">
					<textarea class="inputValue" rows="1" oninput="autoResize(this)"></textarea>
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