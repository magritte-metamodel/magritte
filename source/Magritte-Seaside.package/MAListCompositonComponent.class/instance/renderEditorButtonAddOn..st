rendering-buttons
renderEditorButtonAddOn: html
	html submitButton
		callback: [ self add ];
		text: '>>'.
	html break.
	html submitButton
		callback: [ self remove ];
		text: '<<'