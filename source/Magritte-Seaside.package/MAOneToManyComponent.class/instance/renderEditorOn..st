rendering
renderEditorOn: html
	self renderViewerOn: html.
	self magritteDescription isDefinitive
		ifFalse: [ self renderSelectListOn: html ]