

$(document).ready(function() {
    $('select').material_select();
});

function syncItems(){
	Materialize.toast("Items Synced",1000);
}

function redirectTo(url){
	document.location.href = url;
}

function sendAjax(servlet,display){

	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
	    if (xmlhttp.readyState == XMLHttpRequest.DONE ) {
	       if (xmlhttp.status == 200) {
	       	   var json=JSON.parse(xmlhttp.responseText);
	           console.log(json);
	           if(display!=null && display==true){
	           		var deptTable=document.getElementById('deptTable');
	           		var acadTable=document.getElementById('acadTable');
	           		var invTable=document.getElementById('invTable');
	           		var finTable=document.getElementById('finTable');

	           		deptTable.innerHTML="";
	           		acadTable.innerHTML="";
	           		invTable.innerHTML="";
	           		finTable.innerHTML="";

	           		var row, col1, col2;

	           		for(var i=0;i<json["department"].length;i++){
	           			row=deptTable.insertRow(i);
	           			col1=row.insertCell(0);
	           			col2=row.insertCell(1);
	           			var line=json["department"][i];
	           			var splitArray=line.split(":");
	           			col1.innerHTML=splitArray[0].toUpperCase();
	           			col2.innerHTML=splitArray[1].toUpperCase();
	           		}
	           		for(var i=0;i<json["inventory"].length;i++){
	           			row=invTable.insertRow(i);
	           			col1=row.insertCell(0);
	           			col2=row.insertCell(1);
	           			var line=json["inventory"][i];
	           			var splitArray=line.split(":");
	           			col1.innerHTML=splitArray[0].toUpperCase();
	           			col2.innerHTML=splitArray[1].toUpperCase();
	           		}
	           		for(var i=0;i<json["finance"].length;i++){
	           			row=finTable.insertRow(i);
	           			col1=row.insertCell(0);
	           			col2=row.insertCell(1);
	           			var line=json["finance"][i];
	           			var splitArray=line.split(":");
	           			col1.innerHTML=splitArray[0].toUpperCase();
	           			col2.innerHTML=splitArray[1].toUpperCase();
	           		}
	           		for(var i=0;i<json["academic"].length;i++){
	           			row=acadTable.insertRow(i);
	           			col1=row.insertCell(0);
	           			col2=row.insertCell(1);
	           			var line=json["academic"][i];
	           			var splitArray=line.split(":");
	           			col1.innerHTML=splitArray[0].toUpperCase();
	           			col2.innerHTML=splitArray[1].toUpperCase();
	           		}
	           }
	           else if(display!=null && display==false){
	           		/*var studContent=document.getElementById('studContent');
	           		studContent.innerHTML="";
	           		for(var i=0;i<json["details"].length;i++){
	           			studContent.innerHTML+=(json["details"][i]+'<br/>');
	           		}
					*/
	           		var studTable=document.getElementById('studTable');
	           		var row, col1, col2;
	           		
	           		for(var i=0;i<json["details"].length;i++){
	           			row=studTable.insertRow(i);
	           			col1=row.insertCell(0);
	           			col2=row.insertCell(1);
	           			var line=json["details"][i];
	           			var splitArray=line.split(":");
	           			col1.innerHTML=splitArray[0].toUpperCase();
	           			col2.innerHTML=splitArray[1].toUpperCase();
	           		}
	           }
	           else if(display!=null && display=="login"){
	           		if(json["success"]=="0"){
	           			Materialize.toast("Invalid User",1000);
	           		}
	           		else if(json["success"]==1){
	           			Materialize.toast("Invalid Type",1000);
	           		}
	           		else{
	           			Materialize.toast("Login Success",1000);
	           			redirectTo(json["url"]);
	           		}
	           }
	       }
	      
	    }
	};

	xmlhttp.open("POST", servlet, true);
	xmlhttp.send();	
}


function orderCardCreator(){
	document.getElementById('orderFormDiv').style.display='block';
}

function academicCardCreator(){
	document.getElementById('academicFormDiv').style.display='block';
}

function financeCardCreator(){
	document.getElementById('financeFormDiv').style.display='block';
}

function studentCardCreator(){
	document.getElementById('studentFormDiv').style.display='block';
}

function studentUpdateCardCreator(){
	document.getElementById('studentUpdateFormDiv').style.display='block';
}

function semesterUpdateCardCreator(){
	document.getElementById('semesterFormDiv').style.display='block';	
}

function placeOrder(){
	Materialize.toast('Order Placed', 1000);
	var inventorySelect=document.getElementById('inventorySelect');
	var item=inventorySelect.options[inventorySelect.selectedIndex].text;
	var qty=document.getElementById('orderForm').qty.value;
	var value=inventorySelect.options[inventorySelect.selectedIndex].value;
	sendAjax('SecretaryServlet?type=inventory&'+'item='+item+'&qty='+qty+'&price='+value);
	sendAjax('SecretaryServlet?type=first',true);
	document.getElementById('orderFormDiv').style.display='none';
}

function saveAcademicActivity(){
	Materialize.toast("Academic Activity Saved", 1000);
	var form=document.getElementById('academicForm');
	sendAjax('SecretaryServlet?type=academic&title='+form.title.value+'&author='+form.author.value);
	sendAjax('SecretaryServlet?type=first',true);
	document.getElementById('academicFormDiv').style.display='none';
}

function saveFinancialActivity(){
	Materialize.toast("Financial Activity Saved", 1000);
	var form=document.getElementById('financeForm');
	sendAjax('SecretaryServlet?type=finance&donor='+form.donor.value+'&amount='+form.amount.value);
	sendAjax('SecretaryServlet?type=first',true);
	document.getElementById('financeFormDiv').style.display='none';
}

function addStudent(){
	Materialize.toast('Student Added',1000);
	var form=document.getElementById('studentForm');
	sendAjax('SecretaryServlet?type=student&appNum='+form.appNum.value+'&phone='+form.phone.value+'&name='+form.name.value);
	sendAjax('SecretaryServlet?type=first',true);
	document.getElementById('studentFormDiv').style.display='none';
}

function updateStudent(){
	Materialize.toast('Student Updated',1000);
	var form=document.getElementById('studentUpdateForm');
	var url='StudentServlet?type=studentUpdate';
	url+='&name='+localStorage.studentName;
	url+='&fatherName='+form.fatherName.value
	url+='&motherName='+form.motherName.value
	url+='&city='+form.motherName.value
	url+='&state='+form.state.value;
	sendAjax(url);
	document.getElementById('studentUpdateFormDiv').style.display='none';
	sendAjax('StudentServlet?type=first&name='+localStorage.studentName,false);
}

function updateStudentSemester(){
	var form=document.getElementById('studentUpdateForm');
	Materialize.toast('Semester Details Updated: '+form.name.value,1000);
	var url='InstructorServlet?type=semesterUpdate'
			+'&name='+form.name.value
			+'&ooad='+form.ooad.value
			+'&ml='+form.ml.value;
	sendAjax(url);
	document.getElementById('semesterFormDiv').style.display='none';
}	

function loginSend(){
	var form=document.getElementById("loginForm");
	var url='LoginServlet?type='+form.type.value
			+'&username='+form.username.value
			+'&password='+form.password.value;
	console.log(url);
	sendAjax(url,'login');
}

function done(){
	Materialize.toast("GoodBye!",1000);
	redirectTo("index.html");
}