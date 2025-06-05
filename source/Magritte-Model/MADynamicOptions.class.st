Class {
	#name : 'MADynamicOptions',
	#superclass : 'Object',
	#instVars : [
		'block',
		'completionToObjectBlock',
		'includesBlock'
	],
	#category : 'Magritte-Model-Utility'
}

{ #category : 'as yet unclassified' }
MADynamicOptions class >> block: aBlock [
	^ self new
			block: aBlock;
			yourself.
]

{ #category : 'as yet unclassified' }
MADynamicOptions >> block [
	^ block
]

{ #category : 'as yet unclassified' }
MADynamicOptions >> block: aBlock [
	block := aBlock
]

{ #category : 'as yet unclassified' }
MADynamicOptions >> detect: anObject [
	"Convert from a possibly-optimized object for entry-completion, to the object that should be saved"
	^ self reader value: anObject
]

{ #category : 'as yet unclassified' }
MADynamicOptions >> includes: anObject [
	^ includesBlock value: anObject
]

{ #category : 'as yet unclassified' }
MADynamicOptions >> includesBlock [
	^ includesBlock
]

{ #category : 'as yet unclassified' }
MADynamicOptions >> includesBlock: aBlock [
	includesBlock := aBlock
]

{ #category : 'as yet unclassified' }
MADynamicOptions >> maAllOptionsFor: anOptionDescription [ 
	^ self
]

{ #category : 'as yet unclassified' }
MADynamicOptions >> maSelectMatching: aString [ 
	^ self block value: aString
]

{ #category : 'as yet unclassified' }
MADynamicOptions >> reader [
	^ completionToObjectBlock ifNil: [ [ :obj | obj ] ]
]

{ #category : 'as yet unclassified' }
MADynamicOptions >> reader: aBlock [
	completionToObjectBlock := aBlock
]
