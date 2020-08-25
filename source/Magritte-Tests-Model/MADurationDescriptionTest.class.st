Class {
	#name : #MADurationDescriptionTest,
	#superclass : #MAMagnitudeDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MADurationDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
MADurationDescriptionTest >> actualClass [
	^ MADurationDescription
]

{ #category : #private }
MADurationDescriptionTest >> excludedInstance [
	^ Duration days: 0 hours: 0 minutes: 0 seconds: 2
]

{ #category : #private }
MADurationDescriptionTest >> includedInstance [
	^ Duration days: 1 hours: 2 minutes: 3 seconds: 4
]

{ #category : #private }
MADurationDescriptionTest >> maxInstance [
	^ Duration days: 2 hours: 2 minutes: 3 seconds: 4
]

{ #category : #private }
MADurationDescriptionTest >> minInstance [
	^ Duration days: 0 hours: 2 minutes: 3 seconds: 4
]
