Class {
	#name : #MASymbolDescriptionTest,
	#superclass : #MAStringDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MASymbolDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
MASymbolDescriptionTest >> actualClass [
	^ MASymbolDescription
]

{ #category : #private }
MASymbolDescriptionTest >> includedInstance [
	^ #magritte
]

{ #category : #'tests-validation' }
MASymbolDescriptionTest >> testValidateConditions [
]
