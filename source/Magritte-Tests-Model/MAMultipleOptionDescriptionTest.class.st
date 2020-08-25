Class {
	#name : #MAMultipleOptionDescriptionTest,
	#superclass : #MAOptionDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #'accessing-default' }
MAMultipleOptionDescriptionTest class >> defaultUnique [
	^ false
]

{ #category : #testing }
MAMultipleOptionDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
MAMultipleOptionDescriptionTest >> actualClass [
	^ MAMultipleOptionDescription
]

{ #category : #private }
MAMultipleOptionDescriptionTest >> includedInstance [
	^ self optionInstances copyFrom: 1 to: 2
]

{ #category : #'tests-properties' }
MAMultipleOptionDescriptionTest >> testOrdered [
	self description beOrdered.
	self assert: self description isOrdered.
	self assert: self description ordered.

	self description beUnordered.
	self deny: self description isOrdered.
	self deny: self description ordered
]

{ #category : #'tests-properties' }
MAMultipleOptionDescriptionTest >> testSorted [
	self description beDistinct.
	self assert: self description isDistinct.
	self assert: self description distinct.

	self description beIndefinite.
	self deny: self description isDistinct.
	self deny: self description distinct
]
