Class {
	#name : #MADescriptionMethodSource,
	#superclass : #MABasicObject,
	#instVars : [
		'modelClass',
		'methodSelector'
	],
	#category : #'Magritte-Model-Utility'
}

{ #category : #comparing }
MADescriptionMethodSource >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].

	self class = anObject class
		ifFalse: [ ^ false ].

	^ self methodSelector = anObject methodSelector
		and: [ self modelClass = anObject modelClass ]
]

{ #category : #accessing }
MADescriptionMethodSource >> compiledMethod [
	^ self methodClass
		ifNotNil: [ :aClass | aClass >> self methodSelector asSymbol ]
]

{ #category : #comparing }
MADescriptionMethodSource >> hash [
	^ self methodSelector hash
		bitXor: (self modelClass hash)
]

{ #category : #accessing }
MADescriptionMethodSource >> methodClass [
	^ self modelClass whichClassIncludesSelector: self methodSelector
]

{ #category : #accessing }
MADescriptionMethodSource >> methodSelector [
	^ methodSelector
]

{ #category : #accessing }
MADescriptionMethodSource >> methodSelector: anObject [
	methodSelector := anObject
]

{ #category : #accessing }
MADescriptionMethodSource >> modelClass [
	^ modelClass
]

{ #category : #accessing }
MADescriptionMethodSource >> modelClass: anObject [
	modelClass := anObject
]

{ #category : #accessing }
MADescriptionMethodSource >> printOn: aStream [
	| aMethodClass |
	super printOn: aStream.

	self modelClass ifNil: [ ^ self ].
	self methodSelector ifNil: [ ^ self ].
	aMethodClass := self methodClass.

	aStream nextPut: $(.

	aMethodClass ifNil: [ aStream nextPutAll: 'Missing method ' ].

	aStream print: self modelClass.

	self modelClass = aMethodClass
		ifFalse: [ aStream
				nextPut: $(;
				print: aMethodClass;
				nextPut: $) ].

	aStream
		nextPutAll: '>>#';
		nextPutAll: self methodSelector asString;
		nextPut: $)
]
