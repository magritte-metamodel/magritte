Class {
	#name : #MAStraightMementoTest,
	#superclass : #MAMementoTest,
	#category : 'Magritte-Tests-Model-Memento'
}

{ #category : #testing }
MAStraightMementoTest class >> isAbstract [
	^ false
]

{ #category : #private }
MAStraightMementoTest >> actualClass [
	^ MAStraightMemento
]

{ #category : #'tests-actions' }
MAStraightMementoTest >> testCommit [
	self write: self includedInstance.
	self assert: self value = self includedInstance.
	self assert: self read = self includedInstance.

	self memento commit.
	self assert: self value = self includedInstance.
	self assert: self read = self includedInstance
]

{ #category : #'tests-basic' }
MAStraightMementoTest >> testRead [
	self assert: self read = self defaultInstance.

	self value: self includedInstance.
	self assert: self read = self includedInstance.

	self value: self defaultInstance.
	self assert: self read = self defaultInstance
]

{ #category : #'tests-actions' }
MAStraightMementoTest >> testReset [
	self write: self includedInstance.
	self memento reset.
	self assert: self read = self includedInstance
]

{ #category : #'tests-actions' }
MAStraightMementoTest >> testValidateRequired [
]

{ #category : #'tests-basic' }
MAStraightMementoTest >> testWrite [
	self write: self includedInstance.
	self assert: self value = self includedInstance.

	self write: self defaultInstance.
	self assert: self value = self defaultInstance.

	self write: self nullInstance.
	self assert: self value = self nullInstance
]
