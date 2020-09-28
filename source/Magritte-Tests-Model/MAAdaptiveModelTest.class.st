Class {
	#name : #MAAdaptiveModelTest,
	#superclass : #TestCase,
	#instVars : [
		'scaffolder'
	],
	#category : 'Magritte-Tests-Model-Models'
}

{ #category : #accessing }
MAAdaptiveModelTest >> descriptions [
	^ self scaffolder magritteDescription children
]

{ #category : #accessing }
MAAdaptiveModelTest >> scaffolder [
	^ scaffolder
]

{ #category : #running }
MAAdaptiveModelTest >> setUp [
	scaffolder := MAAdaptiveModel new.
	scaffolder magritteDescription
		add: MAStringDescription new;
		add: MANumberDescription new.
	scaffolder write: 'foo' using: self descriptions first.
	scaffolder write: 123 using: self descriptions second
]

{ #category : #tests }
MAAdaptiveModelTest >> testRead [
	self assert: (self scaffolder readUsing: self descriptions first) = 'foo'.
	self assert: (self scaffolder readUsing: self descriptions second) = 123
]

{ #category : #tests }
MAAdaptiveModelTest >> testWrite [
	self scaffolder write: 'bar' using: self descriptions first.
	self scaffolder write: 321 using: self descriptions second.

	self assert: (self scaffolder readUsing: self descriptions first) = 'bar'.
	self assert: (self scaffolder readUsing: self descriptions second) = 321
]
