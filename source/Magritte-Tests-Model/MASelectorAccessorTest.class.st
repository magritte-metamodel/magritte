Class {
	#name : #MASelectorAccessorTest,
	#superclass : #MAAccessorTest,
	#category : 'Magritte-Tests-Model-Accessor'
}

{ #category : #testing }
MASelectorAccessorTest class >> isAbstract [
	^ false
]

{ #category : #private }
MASelectorAccessorTest >> accessorInstance [
	^ self actualClass selector: #value
]

{ #category : #private }
MASelectorAccessorTest >> actualClass [
	^ MASelectorAccessor
]

{ #category : #'tests-identity' }
MASelectorAccessorTest >> testAsAccessor [
	super testAsAccessor.
	self assert: #value asAccessor = self instance.
	self deny: #value asAccessor == self instance
]

{ #category : #'tests-testing' }
MASelectorAccessorTest >> testCanRead [
	self assert: (self accessor canRead: self).

	self accessor readSelector: #zork.
	self deny: (self accessor canRead: self).

	self accessor readSelector: nil.
	self deny: (self accessor canRead: self)
]

{ #category : #'tests-testing' }
MASelectorAccessorTest >> testCanWrite [
	self assert: (self accessor canWrite: self).

	self accessor writeSelector: #zork:.
	self deny: (self accessor canWrite: self).

	self accessor writeSelector: nil.
	self deny: (self accessor canWrite: self)
]

{ #category : #tests }
MASelectorAccessorTest >> testRead [
	self value: 123.
	self assert: (self accessor read: self) = 123.

	self value: '12'.
	self assert: (self accessor read: self) = '12'
]

{ #category : #tests }
MASelectorAccessorTest >> testReadSelector [
	self accessor readSelector: #contents.

	self assert: self accessor selector = #contents.
	self assert: self accessor readSelector = #contents.
	self assert: self accessor writeSelector = #value:
]

{ #category : #tests }
MASelectorAccessorTest >> testSelector [
	self accessor selector: #contents.

	self assert: self accessor selector = #contents.
	self assert: self accessor readSelector = #contents.
	self assert: self accessor writeSelector = #contents:
]

{ #category : #tests }
MASelectorAccessorTest >> testWrite [
	self accessor write: 123 to: self.
	self assert: self value = 123.

	self accessor write: '123' to: self.
	self assert: self value = '123'
]

{ #category : #tests }
MASelectorAccessorTest >> testWriteSelector [
	self accessor writeSelector: #contents:.

	self assert: self accessor selector = #value.
	self assert: self accessor readSelector = #value.
	self assert: self accessor writeSelector = #contents:
]
