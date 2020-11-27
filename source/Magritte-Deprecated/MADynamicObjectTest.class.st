Class {
	#name : #MADynamicObjectTest,
	#superclass : #TestCase,
	#category : 'Magritte-Deprecated'
}

{ #category : #tests }
MADynamicObjectTest >> testCalculated [
	| object dummy |
	object := [ Time millisecondClockValue ] magritteDynamicObject.
	dummy := object yourself.

	(Delay forMilliseconds: 2) wait.
	self assert: dummy < object yourself
]

{ #category : #tests }
MADynamicObjectTest >> testCollection [
	| object |
	object := [ OrderedCollection with: 1 with: 2 ] magritteDynamicObject.
	self assert: object size = 2.
	self assert: object first = 1.
	self assert: object second = 2.

	object add: 3.
	self assert: object size = 2.
	self assert: object first = 1.
	self assert: object second = 2
]

{ #category : #tests }
MADynamicObjectTest >> testConstant [
	| object |
	object := [ self ] magritteDynamicObject.
	self assert: object = self.

	object := [ 123 ] magritteDynamicObject.
	self assert: object = 123
]

{ #category : #tests }
MADynamicObjectTest >> testCopy [
	| object first second |
	object := [ Time millisecondClockValue ] magritteDynamicObject copy.
	first := object yourself.
	(Delay forMilliseconds: 2) wait.
	second := object yourself.

	self assert: first < second
]

{ #category : #tests }
MADynamicObjectTest >> testCounter [
	| object counter |
	counter := nil.
	object := [
		counter := counter isNil
			ifTrue: [ 1 ]
			ifFalse: [ counter := counter + 1 ] ]
		magritteDynamicObject.

	self assert: object = 1.
	self assert: object yourself = 2.
	self assert: object yourself yourself = 3
]

{ #category : #tests }
MADynamicObjectTest >> testDynamic [
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
]

{ #category : #tests }
MADynamicObjectTest >> testException [
	| object |
	object := [ 1 / 0 ] magritteDynamicObject.
	self 
		should: [ object greaseString ]
		raise: ZeroDivide
]

{ #category : #tests }
MADynamicObjectTest >> testNilOrNotNil [
	| object |
	object := [ 1 ] magritteDynamicObject.
	self deny: object isNil.
	self assert: object notNil.

	object := [ nil ] magritteDynamicObject.
	self assert: object isNil.
	self deny: object notNil
]
