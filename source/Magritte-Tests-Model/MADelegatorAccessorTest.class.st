Class {
	#name : #MADelegatorAccessorTest,
	#superclass : #MAAccessorTest,
	#category : 'Magritte-Tests-Model-Accessor'
}

{ #category : #testing }
MADelegatorAccessorTest class >> isAbstract [
	^ false
]

{ #category : #private }
MADelegatorAccessorTest >> accessorInstance [
	^ self actualClass on: (MASelectorAccessor selector: #value)
]

{ #category : #private }
MADelegatorAccessorTest >> actualClass [
	^ MADelegatorAccessor
]

{ #category : #'tests-testing' }
MADelegatorAccessorTest >> testCanRead [
	self assert: (self accessor canRead: self).

	self accessor next readSelector: #zork.
	self deny: (self accessor canRead: self)
]

{ #category : #'tests-testing' }
MADelegatorAccessorTest >> testCanWrite [
	self assert: (self accessor canWrite: self).

	self accessor next writeSelector: #zork:.
	self deny: (self accessor canWrite: self)
]

{ #category : #tests }
MADelegatorAccessorTest >> testRead [
	self value: 123.
	self assert: (self accessor read: self) = 123.

	self value: '123'.
	self assert: (self accessor read: self) = '123'
]

{ #category : #tests }
MADelegatorAccessorTest >> testWrite [
	self accessor write: 123 to: self.
	self assert: self value = 123.

	self accessor write: '123' to: self.
	self assert: self value = '123'
]
