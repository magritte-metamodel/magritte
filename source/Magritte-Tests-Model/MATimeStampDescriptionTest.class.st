Class {
	#name : #MATimeStampDescriptionTest,
	#superclass : #MAMagnitudeDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MATimeStampDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
MATimeStampDescriptionTest >> actualClass [
	^ MATimeStampDescription
]

{ #category : #private }
MATimeStampDescriptionTest >> excludedInstance [
	^ GRPlatform current magritteTimeStampClass 
		year: 1980
		month: 1
		day: 11
		hour: 11
		minute: 38
		second: 12
		offset: Duration zero
]

{ #category : #private }
MATimeStampDescriptionTest >> includedInstance [
	^ GRPlatform current magritteTimeStampClass 
		year: 1980
		month: 6
		day: 11
		hour: 11
		minute: 38
		second: 12
		offset: Duration zero
]

{ #category : #private }
MATimeStampDescriptionTest >> maxInstance [
	^ GRPlatform current magritteTimeStampClass 
		year: 1980
		month: 6
		day: 12
		hour: 11
		minute: 38
		second: 12
		offset: Duration zero
]

{ #category : #private }
MATimeStampDescriptionTest >> minInstance [
	^ GRPlatform current magritteTimeStampClass 
		year: 1980
		month: 6
		day: 10
		hour: 11
		minute: 38
		second: 12
		offset: Duration zero
]
