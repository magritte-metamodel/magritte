validation-private
validateSpecific: anObject
	| errors |
	super validateSpecific: anObject.
	(anObject rowCount ~= self rowCount or: [ anObject columnCount ~= self columnCount ])
		ifTrue: [ MAKindError description: self signal: self kindErrorMessage ].
	errors := OrderedCollection new.
	anObject do: [ :row :value :each | 
		[ self reference validate: each ]
			on: MAValidationError
			do: [ :err | errors add: err ] ].
	errors isEmpty ifFalse: [
		MAMultipleErrors
			description: self 
			errors: errors
			signal: self label ]