Class {
	#name : #MADescriptionContext,
	#superclass : #MABasicObject,
	#instVars : [
		'modelClass',
		'methodSelector'
	],
	#category : #'Magritte-Model-Utility'
}

{ #category : #comparing }
MADescriptionContext >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].

	self class = anObject class
		ifFalse: [ ^ false ].

	^ self methodSelector = anObject methodSelector
		and: [ self modelClass = anObject modelClass ]
]

{ #category : #accessing }
MADescriptionContext >> compiledMethod [
	^ self methodClass
		ifNotNil: [ :aClass | aClass >> self methodSelector asSymbol ]
]

{ #category : #comparing }
MADescriptionContext >> hash [
	^ self methodSelector hash
		bitXor: (self modelClass hash)
]

{ #category : #accessing }
MADescriptionContext >> methodClass [
	^ self modelClass whichClassIncludesSelector: self methodSelector
]

{ #category : #accessing }
MADescriptionContext >> methodSelector [
	^ methodSelector
]

{ #category : #accessing }
MADescriptionContext >> methodSelector: anObject [
	methodSelector := anObject
]

{ #category : #accessing }
MADescriptionContext >> modelClass [
	^ modelClass
]

{ #category : #accessing }
MADescriptionContext >> modelClass: anObject [
	modelClass := anObject
]

{ #category : #accessing }
MADescriptionContext >> printOn: aStream [
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
