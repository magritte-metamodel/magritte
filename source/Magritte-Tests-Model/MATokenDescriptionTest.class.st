Class {
	#name : #MATokenDescriptionTest,
	#superclass : #MAReferenceDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MATokenDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
MATokenDescriptionTest >> actualClass [
	^ MATokenDescription
]

{ #category : #private }
MATokenDescriptionTest >> includedInstance [
	^ #( 'foo' 'bar' )
]

{ #category : #'tests-strings' }
MATokenDescriptionTest >> testFromStringInvalid [
	"There is no invalid string input."
]
