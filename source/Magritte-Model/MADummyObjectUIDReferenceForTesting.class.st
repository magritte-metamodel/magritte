Class {
	#name : #MADummyObjectUIDReferenceForTesting,
	#superclass : #MAObjectUIDReference,
	#instVars : [
		'source',
		'object'
	],
	#category : #'Magritte-Model-Core'
}

{ #category : #accessing }
MADummyObjectUIDReferenceForTesting >> object [

	^ object ifNil: [  self source detect: [ :e | e uuid = self uid ] ]
]

{ #category : #accessing }
MADummyObjectUIDReferenceForTesting >> object: anObject [

	object := anObject
]

{ #category : #accessing }
MADummyObjectUIDReferenceForTesting >> source [

	^ source ifNil: [ { object } ]
]

{ #category : #accessing }
MADummyObjectUIDReferenceForTesting >> source: anObject [

	source := anObject
]
