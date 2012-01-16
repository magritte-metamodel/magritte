private
editorFor: anObject
	^ anObject asComponent
		addValidatedForm;
		yourself