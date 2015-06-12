visiting-descriptions
visitContainer: aDescription
	| errors |
	super visitContainer: aDescription.
	self object isNil ifTrue: [ ^ self ].
	errors := OrderedCollection new.
	aDescription do: [ :description |
		[ self
			use: (self object readUsing: description)
			during: [ self visit: description ] ]
				on: MAValidationError
				do: [ :err | errors add: err ] ].
	errors isEmpty ifFalse: [
		MAMultipleErrors
			description: aDescription 
			errors: errors
			signal: aDescription label ]