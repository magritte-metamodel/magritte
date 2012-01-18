tests
testDynamic
	| object collection |
	collection := nil.
	object := [
		collection isNil
			ifTrue: [ collection := OrderedCollection with: 1 with: 2 ]
			ifFalse: [ collection ] ]
		magritteDynamicObject.

	self assert: object size = 2.
	self assert: object first = 1.
	self assert: object second = 2.

	object add: 3.
	self assert: object size = 3.
	self assert: object first = 1.
	self assert: object second = 2.
	self assert: object third = 3