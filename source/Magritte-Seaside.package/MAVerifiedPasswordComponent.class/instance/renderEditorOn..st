rendering
renderEditorOn: html
	super renderEditorOn: html.
	html break.
	html passwordInput
		class: 'verification';
		on: #verificationString of: self