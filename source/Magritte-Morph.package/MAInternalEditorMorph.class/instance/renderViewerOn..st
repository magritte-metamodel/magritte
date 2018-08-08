rendering
renderViewerOn: html
	html render: (self component
		readonly: self isReadonly;
		yourself)