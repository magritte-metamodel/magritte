Class {
	#name : #MAMementoTest,
	#superclass : #MAObjectTest,
	#instVars : [
		'memento',
		'value',
		'description'
	],
	#category : 'Magritte-Tests-Model-Memento'
}

{ #category : #testing }
MAMementoTest class >> isAbstract [
	^ true
]

{ #category : #private }
MAMementoTest >> actualClass [
	^ MAMemento
]

{ #category : #private }
MAMementoTest >> defaultInstance [
	^ 'Lukas Renggli'
]

{ #category : #private }
MAMementoTest >> descriptionInstance [
	^ MAContainer with: (MAStringDescription new
			default: self defaultInstance;
			accessor: #value;
			yourself)
]

{ #category : #accessing }
MAMementoTest >> descriptionValue [
	^ self magritteDescription children first
]

{ #category : #private }
MAMementoTest >> includedInstance [
	^ 'Rene Magritte'
]

{ #category : #accessing }
MAMementoTest >> instance [
	^ memento
]

{ #category : #private }
MAMementoTest >> invalidInstance [
	^ 31415
]

{ #category : #'acessing-magritte' }
MAMementoTest >> magritteDescription [
	^ description
]

{ #category : #accessing }
MAMementoTest >> memento [
	^ memento
]

{ #category : #private }
MAMementoTest >> mementoInstance [
	^ self actualClass model: self modelInstance
]

{ #category : #private }
MAMementoTest >> modelInstance [
	^ self
]

{ #category : #private }
MAMementoTest >> nullInstance [
	^ nil
]

{ #category : #private }
MAMementoTest >> otherInstance [
	^ 'Ursula Freitag'
]

{ #category : #'accessing-memento' }
MAMementoTest >> read [
	^ self memento readUsing: self descriptionValue
]

{ #category : #running }
MAMementoTest >> setUp [
	super setUp.
	description := self descriptionInstance.
	memento := self mementoInstance
]

{ #category : #'tests-actions' }
MAMementoTest >> testCommit [
	self subclassResponsibility
]

{ #category : #'tests-accessing' }
MAMementoTest >> testDescription [
	self assert: self memento magritteDescription = self magritteDescription.
	self assert: self memento magritteDescription = self descriptionInstance
]

{ #category : #'tests-accessing' }
MAMementoTest >> testModel [
	self assert: self memento model = self modelInstance
]

{ #category : #'tests-basic' }
MAMementoTest >> testRead [
	self subclassResponsibility
]

{ #category : #'tests-actions' }
MAMementoTest >> testReset [
	self subclassResponsibility
]

{ #category : #'tests-actions' }
MAMementoTest >> testValidateIncluded [
	self write: self includedInstance.
	self shouldnt: [ self memento validate ] raise: MAValidationError
]

{ #category : #'tests-actions' }
MAMementoTest >> testValidateInvalid [
	self write: self invalidInstance.
	self should: [ self memento validate ] raise: MAValidationError
]

{ #category : #'tests-actions' }
MAMementoTest >> testValidateRequired [
	self descriptionValue beRequired.

	self write: self nullInstance.
	self should: [ self memento validate ] raise: MAValidationError
]

{ #category : #'tests-basic' }
MAMementoTest >> testWrite [
	self subclassResponsibility
]

{ #category : #'accessing-model' }
MAMementoTest >> value [
	^ value
]

{ #category : #'accessing-model' }
MAMementoTest >> value: anObject [
	value := anObject
]

{ #category : #'accessing-memento' }
MAMementoTest >> write: anObject [
	self memento write: anObject using: self descriptionValue
]
