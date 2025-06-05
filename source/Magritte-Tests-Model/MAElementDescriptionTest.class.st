Class {
	#name : 'MAElementDescriptionTest',
	#superclass : 'MADescriptionTest',
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : 'testing' }
MAElementDescriptionTest class >> isAbstract [
	^ true
]

{ #category : 'private' }
MAElementDescriptionTest >> actualClass [
	^ MAElementDescription
]

{ #category : 'private' }
MAElementDescriptionTest >> emptyInstance [
	^ String new
]

{ #category : 'private' }
MAElementDescriptionTest >> includedInstance [
	self subclassResponsibility
]

{ #category : 'private' }
MAElementDescriptionTest >> includedInstanceString [
	^ MAStringWriter write: self includedInstance description: self descriptionInstance
]

{ #category : 'private' }
MAElementDescriptionTest >> invalidInstance [
	^ Object new
]

{ #category : 'private' }
MAElementDescriptionTest >> invalidInstanceString [
	^ self invalidInstance greaseString
]

{ #category : 'private' }
MAElementDescriptionTest >> nonIdenticalInstance [
	^ self includedInstance copy
]

{ #category : 'private' }
MAElementDescriptionTest >> nullInstance [
	^ nil
]

{ #category : 'private' }
MAElementDescriptionTest >> shouldSkipStringTests [
	^ false
]

{ #category : 'tests-validation' }
MAElementDescriptionTest >> testAddCondition [
	self description
		addCondition: [ :value | value isNil ].

	self assert: self description conditions size = 1.
	self assert: self description conditions first value isString
]

{ #category : 'tests-validation' }
MAElementDescriptionTest >> testAddConditionLabelled [
	self description
		addCondition: [ :value | value isNil ]
		labelled: 'ist net nil'.

	self assert: self description conditions size = 1.
	self assert: self description conditions first value = 'ist net nil'
]

{ #category : 'tests-converting' }
MAElementDescriptionTest >> testAsContainer [
	self assert: (self description asContainer size) = 1.
	self assert: (self description asContainer includes: self description)
]

{ #category : 'tests-operators' }
MAElementDescriptionTest >> testConcatenation [
	| child1 child2 concatenate |
	child1 := self description copy.
	child2 := self description copy.

	concatenate := child1 , child2.
	self assert: concatenate size = 2.
	self assert: concatenate children first = child1.
	self assert: concatenate children second = child2.

	concatenate := child1 , concatenate.
	self assert: concatenate size = 3.
	self assert: concatenate children first = child1.
	self assert: concatenate children second = child1.
	self assert: concatenate children third = child2
]

{ #category : 'tests-copying' }
MAElementDescriptionTest >> testCopy [
	super testCopy.
	self assert: self description copy default = self description default
]

{ #category : 'tests-accessing' }
MAElementDescriptionTest >> testDefault [
	self description default: self includedInstance.
	self assert: self description default = self includedInstance
]

{ #category : 'private' }
MAElementDescriptionTest >> testDisplay: aBlockOrSymbol [
	"All MAElementDescription classes should respect #display:, but rather than have a bunch of failing tests, we'll implement as needed"

	self description display: aBlockOrSymbol. 	
	self 
		assert: (description toString: self includedInstance) 
		equals: (aBlockOrSymbol value: self includedInstance).
]

{ #category : 'tests-strings' }
MAElementDescriptionTest >> testFromString [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		fromString: self includedInstanceString)
			equals: self includedInstance.
	self assert: (self description
		fromString: self includedInstanceString
		reader: self description stringReader)
			equals: self includedInstance.
	self assert: (self description
		fromString: self includedInstanceString
		reader: self description stringReader new)
			equals: self includedInstance
]

{ #category : 'tests-strings' }
MAElementDescriptionTest >> testFromStringCollection [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		fromStringCollection: (Array
			with: self includedInstanceString
			with: self includedInstanceString))
				= (Array
					with: self includedInstance
					with: self includedInstance).
	self assert: (self description
		fromStringCollection: (Array
			with: self includedInstanceString
			with: self includedInstanceString)
		reader: self description stringReader)
				= (Array
					with: self includedInstance
					with: self includedInstance)
]

{ #category : 'tests-strings' }
MAElementDescriptionTest >> testFromStringEvaluated [
	"This ensures that the parsing algorithm doesn't compile the input, what would cause a  security hole in the framework."

	| error |
	error := nil.
	self shouldSkipStringTests ifTrue: [ ^ self ].
	[ self description fromString: '1 / 0. nil' ]
		on: Exception 
		do: [ :err | error := err ].
	self deny: (error isKindOf: ZeroDivide)
]

{ #category : 'tests-strings' }
MAElementDescriptionTest >> testFromStringInvalid [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self
		should: [ self description fromString: self invalidInstanceString ]
		raise: MAReadError
]

{ #category : 'tests-strings' }
MAElementDescriptionTest >> testFromStringNull [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		fromString: self emptyInstance) isNil.
	self assert: (self description
		fromString: self emptyInstance
		reader: self description stringReader) isNil.
	self assert: (self description
		fromString: self emptyInstance
		reader: self description stringReader new) isNil
]

{ #category : 'tests-accessing' }
MAElementDescriptionTest >> testKind [
	self assert: (self includedInstance isKindOf: self description kind)
]

{ #category : 'tests-validation' }
MAElementDescriptionTest >> testKindErrorMessage [
	self assert: self description kindErrorMessage notEmpty.

	self description kindErrorMessage: 'zork'.
	self assert: self description kindErrorMessage = 'zork'.

	[ self description validateKind: self invalidInstance ]
		on: MAKindError
		do: [ :err | self assert: self description kindErrorMessage = err messageText ]
]

{ #category : 'tests-validation' }
MAElementDescriptionTest >> testRequiredErrorMessage [
	self assert: self description requiredErrorMessage notEmpty.

	self description requiredErrorMessage: 'zork'.
	self assert: self description requiredErrorMessage = 'zork'.

	[ self description beRequired; validateRequired: self nullInstance ]
		on: MARequiredError
		do: [ :err | self assert: self description requiredErrorMessage = err messageText ]
]

{ #category : 'tests-testing' }
MAElementDescriptionTest >> testSatisfied [
	self assert: (self description isSatisfiedBy: self includedInstance).
	self assert: (self description isSatisfiedBy: self nullInstance).
	self deny: (self description isSatisfiedBy: self invalidInstance)
]

{ #category : 'tests-accessing' }
MAElementDescriptionTest >> testStringReader [
	| object |
	self description stringReader: (object := MAStringReader new).
	self assert: self description stringReader = object
]

{ #category : 'tests-accessing' }
MAElementDescriptionTest >> testStringWriter [
	| object |
	self description stringWriter: (object := MAStringWriter new).
	self assert: self description stringWriter = object
]

{ #category : 'tests-strings' }
MAElementDescriptionTest >> testToString [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		toString: self includedInstance)
			= self includedInstanceString.
	self assert: (self description
		toString: self includedInstance
		writer: self description stringWriter)
			= self includedInstanceString.
	self assert: (self description
		toString: self includedInstance
		writer: self description stringWriter new)
			= self includedInstanceString
]

{ #category : 'tests-strings' }
MAElementDescriptionTest >> testToStringCollection [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		toStringCollection: (Array
			with: self includedInstance
			with: self includedInstance))
				= (Array
					with: self includedInstanceString
					with: self includedInstanceString).
	self assert: (self description
		toStringCollection: (Array
			with: self includedInstance
			with: self includedInstance)
		writer: self description stringWriter)
			= (Array
				with: self includedInstanceString
				with: self includedInstanceString)
]

{ #category : 'tests-strings' }
MAElementDescriptionTest >> testToStringFromString [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		fromString: (self description
			toString: self includedInstance))
				= self includedInstance.
	self assert: (self description
		fromString: (self description
			toString: self includedInstance
			writer: self description stringWriter)
		reader: self description stringReader)
				= self includedInstance.
	self assert: (self description
		fromString: (self description
			toString: self includedInstance
			writer: self description stringWriter new)
		reader: self description stringReader new)
				= self includedInstance
]

{ #category : 'tests-strings' }
MAElementDescriptionTest >> testToStringNull [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self assert: (self description
		toString: self nullInstance)
			= self description undefined.
	self assert: (self description
		toString: self nullInstance
		writer: self description stringWriter)
			= self description undefined.
	self assert: (self description
		toString: self nullInstance
		writer: self description stringWriter new)
			= self description undefined
]

{ #category : 'tests-strings' }
MAElementDescriptionTest >> testToStringUndefined [
	self shouldSkipStringTests ifTrue: [ ^ self ].
	self description undefined: 'n/a'.
	self assert: (self description
		toString: self nullInstance)
			= 'n/a'.
	self assert: (self description
		toString: self nullInstance
		writer: self description stringWriter)
			= 'n/a'.
	self assert: (self description
		toString: self nullInstance
		writer: self description stringWriter new)
			= 'n/a'
]

{ #category : 'tests-accessing' }
MAElementDescriptionTest >> testUndefined [
	self description undefined: 'nop'.
	self assert: self description undefined = 'nop'
]

{ #category : 'tests-accessing' }
MAElementDescriptionTest >> testUndefinedValue [
	self description undefinedValue: 'null'.
	self assert: self description undefinedValue equals: 'null'.
	
	self description accessor: #yourself.
	self assert: (self nullInstance readUsing: self description) equals: 'null'
]

{ #category : 'tests-validation' }
MAElementDescriptionTest >> testValidate [
	self description beRequired.
	self
		shouldnt: [ self description validate: self includedInstance ]
		raise: MAValidationError.
	self
		should: [ self description validate: self invalidInstance ]
		raiseSingle: MAKindError.
	self
		should: [ self description validate: self nullInstance ]
		raiseSingle: MARequiredError
]

{ #category : 'tests-validation' }
MAElementDescriptionTest >> testValidateConditions [
	"This test might fail for MADateDescriptionTest, since there is a bug in Squeak."

	| object |
	object := self includedInstance.
	self description
		addCondition: [ :value | object == value ]
		labelled: 'included instance test'.
	self
		shouldnt: [ self description validate: object ]
		raise: MAConditionError.
	self
		should: [ self description validate: self nonIdenticalInstance ]
		raiseSingle: MAConditionError
]

{ #category : 'tests-validation' }
MAElementDescriptionTest >> testValidateKind [
	self
		should: [ self description validateKind: self invalidInstance ]
		raise: MAKindError.
	self
		shouldnt: [ self description validateKind: self includedInstance ]
		raise: MAKindError
]

{ #category : 'tests-validation' }
MAElementDescriptionTest >> testValidateMultipleFailures [
	"This test might fail for MADateDescriptionTest, since there is a bug in Squeak."

	| object |
	object := self includedInstance.
	self description
		addCondition: [ :value | false ] labelled: 'Condition 1';
		addCondition: [ :value | false ] labelled: 'Condition 2'.
	self
		should: [ self description validate: object ]
		raise: MAMultipleErrors
		withExceptionDo: [ :e | self assert: e collection size equals: 2 ]
]

{ #category : 'tests-validation' }
MAElementDescriptionTest >> testValidateRequired [
	self description beOptional.
	self
		shouldnt: [ self description validateRequired: self nullInstance ]
		raise: MARequiredError.
	self
		shouldnt: [ self description validateRequired: self includedInstance ]
		raise: MARequiredError.

	self description beRequired.
	self
		should: [ self description validateRequired: self nullInstance ]
		raise: MARequiredError.
	self
		shouldnt: [ self description validateRequired: self includedInstance ]
		raise: MARequiredError
]

{ #category : 'tests-validation' }
MAElementDescriptionTest >> testValidateSpecific [
	self
		shouldnt: [ self description validate: self includedInstance ]
		raise: MARequiredError
]
