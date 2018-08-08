rendering
renderEditorOn: html
	html rangeInput
		id: self id;
		onInput: self updateScript;
		min: 0; "default"
		max: 100; "default"
		on: #string of: self.
	html span id: self id , 'v'.
	html script: self updateScript