Class {
	#name : #MAPatchOperation,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'field',
		'oldValue',
		'newValue'
	],
	#category : 'Magritte-Merging'
}

{ #category : #comparing }
MAPatchOperation >> = rhs [
	self species = rhs species ifFalse: [ ^ false ].
	^ self receiver = rhs receiver and: [ self field = rhs field and: [ self oldValue = rhs oldValue and: [ self newValue = rhs newValue ] ] ]
]

{ #category : #accessing }
MAPatchOperation >> children [
	^ #()
]

{ #category : #'as yet unclassified' }
MAPatchOperation >> diffStrings [
	^ { self field label, ': ', self oldValue asString. self field label, ': ', self newValue asString }
]

{ #category : #execution }
MAPatchOperation >> execute [
	self field accessor write: newValue to: receiver
]

{ #category : #accessing }
MAPatchOperation >> field [
	^ field
]

{ #category : #accessing }
MAPatchOperation >> field: anObject [
	field := anObject
]

{ #category : #comparing }
MAPatchOperation >> hash [
	^ ((self receiver hash bitXor: self field hash) bitXor: self oldValue hash) bitXor: self newValue hash
]

{ #category : #accessing }
MAPatchOperation >> newValue [
	^ newValue
]

{ #category : #accessing }
MAPatchOperation >> newValue: anObject [
	newValue := anObject
]

{ #category : #accessing }
MAPatchOperation >> oldValue [
	^ oldValue
]

{ #category : #accessing }
MAPatchOperation >> oldValue: anObject [
	oldValue := anObject
]

{ #category : #accessing }
MAPatchOperation >> operations [
	^ { self }
]

{ #category : #printing }
MAPatchOperation >> printOn: aStream [

	aStream
		nextPutAll: 'Change ';
		nextPutAll: field label;
		nextPutAll: ' from ';
		print: oldValue;
		nextPutAll: ' to ';
		print: newValue
]

{ #category : #accessing }
MAPatchOperation >> receiver [
	^ receiver
]

{ #category : #accessing }
MAPatchOperation >> receiver: anObject [
	receiver := anObject
]
