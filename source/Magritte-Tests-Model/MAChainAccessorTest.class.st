Class {
	#name : #MAChainAccessorTest,
	#superclass : #MADelegatorAccessorTest,
	#category : 'Magritte-Tests-Model-Accessor'
}

{ #category : #testing }
MAChainAccessorTest class >> isAbstract [
	^ false
]

{ #category : #private }
MAChainAccessorTest >> accessorInstance [
	^ self actualClass accessors: #( holder contents value )
]

{ #category : #private }
MAChainAccessorTest >> actualClass [
	^ MAChainAccessor
]

{ #category : #private }
MAChainAccessorTest >> holder [
	^ MAValueHolder on: self
]

{ #category : #tests }
MAChainAccessorTest >> testAccessor [
	self accessor accessor: self.
	self assert: self accessor accessor = self
]

{ #category : #tests }
MAChainAccessorTest >> testAsAccessor [
	super testAsAccessor.
	
	accessor := #(value) asAccessor.
	self assert: (accessor isKindOf: MASelectorAccessor).
	self assert: (accessor selector = #value).
	
	accessor := #(value contents) asAccessor.
	self assert: (accessor isKindOf: MAChainAccessor).
	self assert: (accessor next isKindOf: MASelectorAccessor).
	self assert: (accessor next selector = #value).
	self assert: (accessor accessor isKindOf: MASelectorAccessor).
	self assert: (accessor accessor selector = #contents)
]

{ #category : #'tests-testing' }
MAChainAccessorTest >> testCanRead [
	self assert: (self accessor canRead: self).
	self accessor accessor accessor readSelector: #zork.
	self deny: (self accessor canRead: self)
]

{ #category : #'tests-testing' }
MAChainAccessorTest >> testCanWrite [
	self assert: (self accessor canWrite: self).
	self accessor accessor accessor writeSelector: #zork.
	self deny: (self accessor canWrite: self)
]

{ #category : #tests }
MAChainAccessorTest >> testKind [
	self assert: (self accessor class = MAChainAccessor).
	self assert: (self accessor next class = MASelectorAccessor).
	self assert: (self accessor accessor class = MAChainAccessor).
	self assert: (self accessor accessor next class = MASelectorAccessor).
	self assert: (self accessor accessor accessor class = MASelectorAccessor)
]

{ #category : #tests }
MAChainAccessorTest >> testNext [
	| next |
	next := #foo asAccessor.
	self accessor next: next.
	self assert: self accessor next = next
]

{ #category : #tests }
MAChainAccessorTest >> testRead [
	self value: 123.
	self assert: (self accessor read: self) = 123.

	self value: '12'.
	self assert: (self accessor read: self) = '12'
]

{ #category : #tests }
MAChainAccessorTest >> testSelector [
	self assert: self accessor next selector = #holder.
	self assert: self accessor accessor next selector = #contents.
	self assert: self accessor accessor accessor selector = #value
]

{ #category : #tests }
MAChainAccessorTest >> testWrite [
	self accessor write: 123 to: self.
	self assert: self value = 123.

	self accessor write: '123' to: self.
	self assert: self value = '123'
]
