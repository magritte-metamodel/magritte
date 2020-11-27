Class {
	#name : #MAColorDescriptionTest,
	#superclass : #MAElementDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MAColorDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
MAColorDescriptionTest >> actualClass [
	^ MAColorDescription
]

{ #category : #private }
MAColorDescriptionTest >> includedInstance [
	^ GRPlatform current magritteColorClass blue
]
