rendering
renderContentOn: html
	self isReadonly
		ifTrue: [ self renderViewerOn: html ]
		ifFalse: [ self renderEditorOn: html ]