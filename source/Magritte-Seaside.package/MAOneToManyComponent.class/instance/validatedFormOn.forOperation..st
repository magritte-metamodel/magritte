private
validatedFormOn: result forOperation: aString
	^ result asComponent
		addMessage: aString , ' ' , self selected label;
		addValidatedForm;
		yourself