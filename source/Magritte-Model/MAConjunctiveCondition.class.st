Class {
	#name : #MAConjunctiveCondition,
	#superclass : #MACondition,
	#instVars : [
		'conditions'
	],
	#category : #'Magritte-Model-Utility'
}

{ #category : #operators }
MAConjunctiveCondition >> & aCondition [
	conditions := conditions copyWith: aCondition
]

{ #category : #initialization }
MAConjunctiveCondition >> initialize [
	conditions := #()
]

{ #category : #evaluating }
MAConjunctiveCondition >> value: anObject [

	conditions 
		detect: [ :each | (each value: anObject) not ]
		ifFound: [ ^ false ].
		
	^ true
]
