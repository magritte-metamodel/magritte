Class {
	#name : #MADerivedDescriptions,
	#superclass : #TestCase,
	#instVars : [
		'baseModel',
		'derivedModel'
	],
	#category : 'Magritte-Tests-Model-Utility'
}

{ #category : #running }
MADerivedDescriptions >> setUp [
	super setUp.
	
	baseModel := MAMockAddress new.
	derivedModel := MAMockAddress2 new. 
]

{ #category : #tests }
MADerivedDescriptions >> testContainer [
	self assert: (baseModel magritteDescription hasProperty: #addressContainerBase).
	self assert: (derivedModel magritteDescription hasProperty: #addressContainerDerived)
]

{ #category : #tests }
MADerivedDescriptions >> testDescription [
	| baseDescription derivedDescription |
	
	baseDescription := baseModel magritteDescription detect: [ :each | each accessor selector = #street ].
	self assert: baseDescription isRequired not.
	
	derivedDescription := derivedModel magritteDescription detect: [ :each | each accessor selector = #street ].
	self assert: derivedDescription isRequired.	
	
]
