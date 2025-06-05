Class {
	#name : 'MABooleanDescriptionTest',
	#superclass : 'MAElementDescriptionTest',
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : 'testing' }
MABooleanDescriptionTest class >> isAbstract [
	^ false
]

{ #category : 'private' }
MABooleanDescriptionTest >> actualClass [
	^ MABooleanDescription
]

{ #category : 'private' }
MABooleanDescriptionTest >> includedInstance [
	^ true
]

{ #category : 'private' }
MABooleanDescriptionTest >> testCaseInsensitiveStrings: aCollection convertTo: aBoolean [
	| lowercaseStrings uppercaseStrings |
	lowercaseStrings := aCollection.
	uppercaseStrings := lowercaseStrings collect: [ :e | e asUppercase ].
	lowercaseStrings, uppercaseStrings do: [ :e | 
		self assert: (self description fromString: e) = aBoolean ]
]

{ #category : 'tests' }
MABooleanDescriptionTest >> testFalseString [
	self description falseString: 'nein'.
	self assert: (self description labelForOption: false) = 'nein'
]

{ #category : 'tests' }
MABooleanDescriptionTest >> testFalseStrings [
	self testCaseInsensitiveStrings: #( 'false' 'f' 'no' 'n' '0' 'off' ) convertTo: false
]

{ #category : 'tests' }
MABooleanDescriptionTest >> testLabelForOption [
	self assert: (self description labelForOption: true) = 'true'.
	self assert: (self description labelForOption: false) = 'false'.
	self assert: (self description labelForOption: nil) = ''
]

{ #category : 'tests' }
MABooleanDescriptionTest >> testOptions [
	self assert: (self description options) = #(false true).
	self assert: (self description allOptionsWith: Object new) = #(false true)
]

{ #category : 'tests' }
MABooleanDescriptionTest >> testTrueString [
	self description trueString: 'ja'.
	self assert: (self description labelForOption: true) = 'ja'
]

{ #category : 'tests' }
MABooleanDescriptionTest >> testTrueStrings [
	self testCaseInsensitiveStrings: #( 'true' 't' 'yes' 'y' '1' 'on' ) convertTo: true
]

{ #category : 'tests-validation' }
MABooleanDescriptionTest >> testValidateConditions [
]
