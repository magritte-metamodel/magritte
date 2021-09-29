Class {
	#name : #MAClassDescriptionTest,
	#superclass : #MAElementDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MAClassDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
MAClassDescriptionTest >> actualClass [
	^ MAClassDescription
]

{ #category : #private }
MAClassDescriptionTest >> includedInstance [
	^ String
]

{ #category : #private }
MAClassDescriptionTest >> nonIdenticalInstance [
	"Classes cannot be copied on some platforms, so we override the inherited
	behaviour in order to return a different class."
	
	^ Object
]

{ #category : #private }
MAClassDescriptionTest >> shouldSkipStringTests [
	^ true
]
