execution
prepareFullExecutionInContext: aToolContext
	super prepareFullExecutionInContext: aToolContext.
	fieldName := UIManager default request: 'Field name'.		
	fieldName isEmptyOrNil ifTrue: [ CmdCommandAborted signal ]