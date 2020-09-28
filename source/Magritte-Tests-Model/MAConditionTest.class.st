Class {
	#name : #MAConditionTest,
	#superclass : #TestCase,
	#category : 'Magritte-Tests-Model-Utility'
}

{ #category : #tests }
MAConditionTest >> testConjunctive [
	| condition |
	condition := (MACondition selector: #isInteger) & (MACondition selector: #positive).
	self assert: (condition value: 1).
	self deny: (condition value: 1.5).	
	self deny: (condition value: -1).
	self deny: (condition value: -1.5)
]

{ #category : #tests }
MAConditionTest >> testDisjunctive [
	| condition |
	condition := (MACondition selector: #isInteger) | (MACondition selector: #positive).
	self assert: (condition value: 1).
	self assert: (condition value: 1.5).	
	self assert: (condition value: -1).
	self deny: (condition value: -1.5)
]

{ #category : #tests }
MAConditionTest >> testNegation [
	| condition |
	condition := (MACondition selector: #isInteger) not.
	self assert: (condition value: 0.6).
	self deny: (condition value: 1)
]

{ #category : #tests }
MAConditionTest >> testReceiverSelector [
	| condition |
	condition := MACondition receiver: 1 selector: #=.
	self assert: (condition value: 1).
	self deny: (condition value: 0)
]

{ #category : #tests }
MAConditionTest >> testSelector [
	| condition |
	condition := MACondition selector: #isInteger.
	self assert: (condition value: -1).
	self assert: (condition value: 1).
	self deny: (condition value: 0.5)
	
]

{ #category : #tests }
MAConditionTest >> testSelectorArgument [
	| condition |
	condition := MACondition selector: #< argument: 5.
	self assert: (condition value: 1).
	self deny: (condition value: 5)
]
