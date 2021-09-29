Class {
	#name : #MANumberDescriptionTest,
	#superclass : #MAMagnitudeDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MANumberDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
MANumberDescriptionTest >> actualClass [
	^ MANumberDescription
]

{ #category : #private }
MANumberDescriptionTest >> excludedInstance [
	^ 0.6180
]

{ #category : #private }
MANumberDescriptionTest >> includedInstance [
	^ 2.7182
]

{ #category : #private }
MANumberDescriptionTest >> maxInstance [
	^ 3.1415
]

{ #category : #private }
MANumberDescriptionTest >> minInstance [
	^ 1.6180
]

{ #category : #tests }
MANumberDescriptionTest >> testBeInteger [
	self description beInteger.
	self assert: (self description isSatisfiedBy: 1).
	self assert: (self description isSatisfiedBy: -1).
	self deny: (self description isSatisfiedBy: 1 / 2).
	self deny: (self description isSatisfiedBy: 1.2)
]

{ #category : #tests }
MANumberDescriptionTest >> testBeNegative [
	self description beNegative.
	self assert: (self description isSatisfiedBy: -1).
	self assert: (self description isSatisfiedBy: -1.5).
	self deny: (self description isSatisfiedBy: 1).
	self deny: (self description isSatisfiedBy: 1.5)
]

{ #category : #tests }
MANumberDescriptionTest >> testBePositive [
	self description bePositive.
	self assert: (self description isSatisfiedBy: 1).
	self assert: (self description isSatisfiedBy: 1.5).
	self deny: (self description isSatisfiedBy: -0.1).
	self deny: (self description isSatisfiedBy: -1)
]

{ #category : #private }
MANumberDescriptionTest >> testFromString [
	"We do some special tests here because #visitNumberDescription: in
	MAStringReader works around problems with Number>>readFrom."
	self shouldSkipStringTests
		ifTrue: [^ self].
	super testFromString.
	self
		should: [self description fromString: 'xyz']
		raise: MAReadError
		description: 'Non-numeric string should raise an error'.
	self
		should: [self description fromString: '12-234']
		raise: MAReadError
		description: 'Non-numeric string should raise an error'.
	self
		should: [self description fromString: '1.4.2007']
		raise: MAReadError
		description: 'Non-numeric string should raise an error'.
	self assert: (self description fromString: '') isNil description: 'Empty string should be parsed to nil'.
	self assert: (self description fromString: '-20')
			= -20 description: 'Negative numbers should be accepted'
]

{ #category : #tests }
MANumberDescriptionTest >> testValidateConditions [
]
