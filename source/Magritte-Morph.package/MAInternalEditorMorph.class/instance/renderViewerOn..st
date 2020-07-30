rendering
renderViewerOn: html
	html render: (self component
		readOnly: self isReadOnly;
		yourself)