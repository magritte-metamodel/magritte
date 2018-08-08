private
buildEditorFor: anObject titled: aString
	^ anObject asComponent
		addValidatedForm;
		addMessage: aString;
		yourself