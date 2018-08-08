rendering-buttons
renderEditorButtonOrderOn: html
	html submitButton
		callback: [ self moveUp ];
		text: 'up'.
	html break.
	html submitButton
		callback: [ self moveDown ];
		text: 'down'