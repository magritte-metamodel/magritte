rendering
renderEditorOn: html
	html textArea
		id: self labelId;
		rows: self magritteDescription lineCount;
		on: #string of: self