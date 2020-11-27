rendering
renderContentOn: html
	self isReadOnly
		ifTrue: [ self renderViewerOn: html ]
		ifFalse: [ self renderEditorOn: html ]