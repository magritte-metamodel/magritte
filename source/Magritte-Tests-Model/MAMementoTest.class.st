Class {
	#name : 'MAMementoTest',
	#superclass : 'MAObjectTest',
	#instVars : [
		'memento',
		'value',
		'description'
	],
	#category : 'Magritte-Tests-Model-Memento'
}

{ #category : 'testing' }
MAMementoTest class >> isAbstract [
	^ true
]

{ #category : 'private' }
MAMementoTest >> actualClass [
	^ MAMemento
]

{ #category : 'private' }
MAMementoTest >> defaultInstance [
	^ 'Lukas Renggli'
]

{ #category : 'private' }
MAMementoTest >> descriptionInstance [
	^ MAContainer with: (MAStringDescription new
			default: self defaultInstance;
			accessor: #value;
			yourself)
]

{ #category : 'accessing' }
MAMementoTest >> descriptionValue [
	^ self magritteDescription children first
]

{ #category : 'private' }
MAMementoTest >> includedInstance [
	^ 'Rene Magritte'
]

{ #category : 'accessing' }
MAMementoTest >> instance [
	^ memento
]

{ #category : 'private' }
MAMementoTest >> invalidInstance [
	^ 31415
]

{ #category : 'acessing-magritte' }
MAMementoTest >> magritteDescription [
	^ description
]

{ #category : 'accessing' }
MAMementoTest >> memento [
	^ memento
]

{ #category : 'private' }
MAMementoTest >> mementoInstance [
	^ self actualClass model: self modelInstance
]

{ #category : 'private' }
MAMementoTest >> modelInstance [
	^ self
]

{ #category : 'private' }
MAMementoTest >> nullInstance [
	^ nil
]

{ #category : 'private' }
MAMementoTest >> otherInstance [
	^ 'Ursula Freitag'
]

{ #category : 'accessing-memento' }
MAMementoTest >> read [
	^ self memento readUsing: self descriptionValue
]

{ #category : 'running' }
MAMementoTest >> setUp [
	super setUp.
	description := self descriptionInstance.
	memento := self mementoInstance
]

{ #category : 'tests-actions' }
MAMementoTest >> testCachedDefaultValues [

	| obj plzDescription |
	obj := MAMockAddress new.
	
	memento := self actualClass
		model: obj
		description: obj magritteDescription.
		
	memento := self actualClass
		model: obj
		description: obj magritteDescription.
		
	plzDescription := obj descriptionPlz
		default: 1;
		shouldCacheDefault: true;
		yourself.
	
	memento push: {
		plzDescription -> plzDescription default } asDictionary.
		
	self assert: obj plz equals: plzDescription default
]

{ #category : 'tests-actions' }
MAMementoTest >> testCommit [
	self subclassResponsibility
]

{ #category : 'tests-accessing' }
MAMementoTest >> testDescription [
	self assert: self memento magritteDescription = self magritteDescription.
	self assert: self memento magritteDescription = self descriptionInstance
]

{ #category : 'tests-accessing' }
MAMementoTest >> testModel [
	self assert: self memento model = self modelInstance
]

{ #category : 'tests-basic' }
MAMementoTest >> testRead [
	self subclassResponsibility
]

{ #category : 'tests-actions' }
MAMementoTest >> testReset [
	self subclassResponsibility
]

{ #category : 'tests-actions' }
MAMementoTest >> testSingletonValue [

	| obj |
	obj := MAMockAddress new
		plzType: Number;
		yourself.
		
	memento := obj mementoClass
		model: obj
		description: obj magritteDescription.
		
	self assert: (memento original at: obj plzTypeDescription) == obj plzType.
]

{ #category : 'tests-actions' }
MAMementoTest >> testUncachedDefaultValues [

	| obj plzDescription |
	obj := MAMockAddress new.
	
	memento := self actualClass
		model: obj
		description: obj magritteDescription.
		
	plzDescription := obj descriptionPlz
		default: 1;
		yourself.
	
	memento push: {
		plzDescription -> plzDescription default } asDictionary.
		
	self assert: obj plz equals: nil
]

{ #category : 'tests-actions' }
MAMementoTest >> testValidateIncluded [
	self write: self includedInstance.
	self shouldnt: [ self memento validate ] raise: MAValidationError
]

{ #category : 'tests-actions' }
MAMementoTest >> testValidateInvalid [
	self write: self invalidInstance.
	self should: [ self memento validate ] raise: MAValidationError
]

{ #category : 'tests-actions' }
MAMementoTest >> testValidateRequired [
	self descriptionValue beRequired.

	self write: self nullInstance.
	self should: [ self memento validate ] raise: MAValidationError
]

{ #category : 'tests-basic' }
MAMementoTest >> testWrite [
	self subclassResponsibility
]

{ #category : 'accessing-model' }
MAMementoTest >> value [
	^ value
]

{ #category : 'accessing-model' }
MAMementoTest >> value: anObject [
	value := anObject
]

{ #category : 'accessing-memento' }
MAMementoTest >> write: anObject [
	self memento write: anObject using: self descriptionValue
]
