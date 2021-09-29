Class {
	#name : #MAToOneRelationDescriptionTest,
	#superclass : #MARelationDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MAToOneRelationDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
MAToOneRelationDescriptionTest >> actualClass [
	^ MAToOneRelationDescription
]

{ #category : #private }
MAToOneRelationDescriptionTest >> includedInstance [
	^ self addressInstance1
]
