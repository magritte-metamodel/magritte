Class {
	#name : #MADateAndTimeDescriptionTest,
	#superclass : #MAMagnitudeDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MADateAndTimeDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
MADateAndTimeDescriptionTest >> actualClass [
	^ MADateAndTimeDescription
]

{ #category : #private }
MADateAndTimeDescriptionTest >> excludedInstance [
	^ DateAndTime year: 1980 month: 1 day: 11 hour: 11 minute: 38 second: 12
]

{ #category : #private }
MADateAndTimeDescriptionTest >> includedInstance [
	^ DateAndTime year: 1980 month: 6 day: 11 hour: 11 minute: 38 second: 12
]

{ #category : #private }
MADateAndTimeDescriptionTest >> maxInstance [
	^ DateAndTime year: 1980 month: 6 day: 12 hour: 11 minute: 38 second: 12
]

{ #category : #private }
MADateAndTimeDescriptionTest >> minInstance [
	^ DateAndTime year: 1980 month: 6 day: 10 hour: 11 minute: 38 second: 12
]

{ #category : #tests }
MADateAndTimeDescriptionTest >> testDisplay [

	self testDisplay: [ :e | e asDate monthName ].
	self testDisplay: #monthName.
]
