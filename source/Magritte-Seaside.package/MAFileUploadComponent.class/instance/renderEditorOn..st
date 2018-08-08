rendering
renderEditorOn: html
	self requiresMultipartForm
		ifTrue: [ self renderUploadOn: html ]
		ifFalse: [ self renderRemoveOn: html ]