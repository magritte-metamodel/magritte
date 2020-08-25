Class {
	#name : #MADateDescriptionTest,
	#superclass : #MAMagnitudeDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MADateDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
MADateDescriptionTest >> actualClass [
	^ MADateDescription
]

{ #category : #private }
MADateDescriptionTest >> excludedInstance [
	^ Date newDay: 1 month: (Date nameOfMonth: 6) year: 1980
]

{ #category : #private }
MADateDescriptionTest >> includedInstance [
	^ Date newDay: 11 month: (Date nameOfMonth: 6) year: 1980
]

{ #category : #private }
MADateDescriptionTest >> maxInstance [
	^ Date newDay: 12 month: (Date nameOfMonth: 6) year: 1980
]

{ #category : #private }
MADateDescriptionTest >> minInstance [
	^ Date newDay: 10 month: (Date nameOfMonth: 6) year: 1980
]
