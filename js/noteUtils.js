function noteCardCreator(){
	document.getElementById('noteFormDiv').style.display='block';
}


function createNewNote(){

	var form=document.getElementById('noteForm');
	var title=form.elements[0].value;
	var content=form.elements[1].value;

	generateNoteCardElements(title, content)

	
	var modal=document.getElementById('noteFormDiv');
	modal.style.display='none';
	Materialize.toast('Note created', 1000);
}


function generateNoteCardElements(title, content){
	var noteDiv=document.createElement('div');
	noteDiv.setAttribute("class","card blue-white");

	var noteContentDiv=document.createElement('div');
	noteContentDiv.setAttribute("class","card-content teal-text");
	
	var titleSpan=document.createElement('span');
	titleSpan.setAttribute("class","card-title red-text");
	
	titleSpan.innerHTML=title;
	var contentP=document.createElement('p');
	contentP.innerHTML=content;
	noteContentDiv.appendChild(titleSpan);
	noteContentDiv.appendChild(contentP);

	noteDiv.appendChild(noteContentDiv);
	document.getElementById('note_container').appendChild(noteDiv);
}


