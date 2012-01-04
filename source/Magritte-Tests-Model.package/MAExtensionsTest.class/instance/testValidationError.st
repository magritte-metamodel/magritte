tests-errors
testValidationError
	| result |
	result := [ MARequiredError signal: 'some message' ]
		on: MARequiredError
		do: [ :err | err return: err greaseString ].
	self assert: result = 'some message'.
	result := [
		MARequiredError 
			description: (MAStringDescription new 
				label: 'label';
				yourself) 
			signal: 'some message' ] 
		on: MARequiredError
		do: [ :err | err return: err greaseString ].
	self assert: result = 'label: some message'