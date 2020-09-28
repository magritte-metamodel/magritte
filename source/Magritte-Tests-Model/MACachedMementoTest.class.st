Class {
	#name : #MACachedMementoTest,
	#superclass : #MAMementoTest,
	#category : 'Magritte-Tests-Model-Memento'
}

{ #category : #testing }
MACachedMementoTest class >> isAbstract [
	^ false
]

{ #category : #private }
MACachedMementoTest >> actualClass [
	^ MACachedMemento
]

{ #category : #'tests-accessing' }
MACachedMementoTest >> testCache [
	self assert: self memento cache size = self magritteDescription size
]

{ #category : #'tests-actions' }
MACachedMementoTest >> testCommit [
	self write: self includedInstance.
	self assert: self read = self includedInstance.
	self assert: self value = self nullInstance.
	self assert: self memento hasChanged.

	self memento commit.
	self assert: self read = self includedInstance.
	self assert: self value = self includedInstance.
	self deny: self memento hasChanged
]

{ #category : #'tests-basic' }
MACachedMementoTest >> testRead [
	self assert: self read = self defaultInstance.

	self value: self includedInstance.
	self assert: self read = self defaultInstance
]

{ #category : #'tests-actions' }
MACachedMementoTest >> testReset [
	self value: self defaultInstance.
	self write: self includedInstance.
	self assert: self memento hasChanged.

	self memento reset.
	self assert: self read = self defaultInstance.
	self assert: self value = self defaultInstance.
	self deny: self memento hasChanged
]

{ #category : #'tests-basic' }
MACachedMementoTest >> testWrite [
	self write: self includedInstance.
	self assert: self read = self includedInstance.
	self assert: self value = self nullInstance.

	self write: self defaultInstance.
	self assert: self read = self defaultInstance.
	self assert: self value = self nullInstance
]
