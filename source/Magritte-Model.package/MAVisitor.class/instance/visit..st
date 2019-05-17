visiting
visit: anObject
	"Visit ==anObject== with the receiving visitor."
	| errors |
	errors := OrderedCollection new.
	[
		anObject acceptMagritte: self.
	]
		on: MAValidationError
		do: [ :err | 
			errors add: err. 
			err resume ].
		
	errors isEmpty ifFalse: [
		MAMultipleErrors
			description: anObject 
			errors: errors
			signal: anObject label ]