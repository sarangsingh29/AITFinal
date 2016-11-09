function emailCreator(){
		document.getElementById('emailFormDiv').style.display='block';
	}

	function sendMail(){
		var modal=document.getElementById('emailFormDiv');
 		modal.style.display='none';
 		Materialize.toast('Email sent',1000);
 		sendAjax();
	}