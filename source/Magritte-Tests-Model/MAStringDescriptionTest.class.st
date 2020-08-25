Class {
	#name : #MAStringDescriptionTest,
	#superclass : #MAElementDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MAStringDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
MAStringDescriptionTest >> actualClass [
	^ MAStringDescription
]

{ #category : #private }
MAStringDescriptionTest >> includedInstance [
	^ 'Lukas Renggli'
]

{ #category : #tests }
MAStringDescriptionTest >> testDisplay [

	self testDisplay: [ :e | e asString allButLast: 2 ].
	self testDisplay: #asString. "Since #asString is the default behavior, this is only showing an example of the API, not actually testing anything. In real use, you might send e.g. #allButLast"
]

{ #category : #'tests-strings' }
MAStringDescriptionTest >> testFromStringInvalid [
	"There is no invalid string input."
]
