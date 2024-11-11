// 결재 반려
document.getElementById('banBtn').addEventListener('click', function(event) {	
	
	event.preventDefault(); // 버튼 클릭으로 발생한 submit 중지

	const sign = document.getElementById('signListModalBtn').innerText; 

	if (sign == "서명 선택") {
		alert("서명 입력 바랍니다.");
		return;
	}
	
	const formData = new FormData(document.getElementById('updateApprForm'));
	
	const docNum = document.getElementById('docNum').innerText;
	formData.append('docNum', docNum);
	const docContent = document.getElementById('docContentText').innerHTML;
	formData.append('docContent', docContent);

	let apprProgress = "반려";
	let apprResult = "반려";
	let approvalResult = "반려";
	formData.append('apprProgress', apprProgress);
	formData.append('apprResult', apprResult);
	formData.append('approvalResult', approvalResult);

	// Ajax 요청
	fetch('/approval/approval', {
	    method: 'POST',
	    body: formData
	})
	.then(response => {
	    if (!response.ok) {
	        throw new Error('췤더마이크로폰원투원투제이슨이즈낫옼께이 : ' + response.status);
	    }
	    return response.json(); // 응답을 JSON으로 변환	
	})
	.then(data => {
		console.log('성공: ', data);
		alert("결재 반려");
		location.href = '/approval/approvalReceivedbox';
	})
	.catch(error => {
		alert("Error");
	    console.error('에러났슈: ', error);
	});
	

});


// 결재 승인
document.getElementById('apprBtn').addEventListener('click', function(event) {	
	
	event.preventDefault(); // 버튼 클릭으로 발생한 submit 중지

	const sign = document.getElementById('signListModalBtn').innerText; 
	
	if (sign == "서명 선택") {
		alert("서명 입력 바랍니다.");
		return;
	}
	
	const formData = new FormData(document.getElementById('updateApprForm'));
	
	const loginID = document.getElementById('hiddenLoginID').value;
	const docNum = document.getElementById('docNum').innerText;
	formData.append('docNum', docNum);
	const approver1 = document.getElementById('hiddenApprover1').value || null;
	const approver2 = document.getElementById('hiddenApprover2').value || null;
	const approver3 = document.getElementById('hiddenApprover3').value || null;
	
	const docContent = document.getElementById('docContentText').innerHTML;
	formData.append('docContent', docContent);
	
	let apprProgress = "승인";
	let approvalResult = "진행";
	if ((loginID === approver3) || 
	    (loginID === approver2 && approver3 === null) || 
	    (loginID === approver1 && approver2 === null)) {
	    apprProgress = "최종승인";
		approvalResult = "승인";
	}
	let apprResult = "승인";
	formData.append('apprProgress', apprProgress);
	formData.append('apprResult', apprResult);
	formData.append('approvalResult', approvalResult);
	
	// Ajax 요청
	fetch('/approval/approval', {
	    method: 'POST',
	    body: formData
	})
	.then(response => {
	    if (!response.ok) {
	        throw new Error('췤더마이크로폰원투원투제이슨이즈낫옼께이 : ' + response.status);
	    }
	    return response.json(); // 응답을 JSON으로 변환	
	})
	.then(data => {
		console.log('성공: ', data);
		alert("결재 승인");
		location.href = '/approval/approvalReceivedbox';
	})
	.catch(error => {
		alert("Error");
	    console.error('에러났슈: ', error);
	});
	

});



