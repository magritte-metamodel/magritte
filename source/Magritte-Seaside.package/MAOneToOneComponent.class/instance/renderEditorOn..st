rendering
renderEditorOn: html
	self value isNil
		ifTrue: [ self renderSelectListOn: html ]
		ifFalse: [ self renderViewerOn: html; renderButtonsOn: html ]