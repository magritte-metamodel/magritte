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
	self assert: (accessor next selector = #contents).
	self assert: (accessor accessor isKindOf: MASelectorAccessor).
	self assert: (accessor accessor selector = #value)
]

{ #category : #'tests-testing' }
MAChainAccessorTest >> testCanRead [
	self assert: (self accessor canRead: self).
	self accessor next accessor readSelector: #zork.
	self deny: (self accessor canRead: self)
]

{ #category : #'tests-testing' }
MAChainAccessorTest >> testCanWrite [
	self assert: (self accessor canWrite: self).
	self accessor next accessor writeSelector: #zork.
	self deny: (self accessor accessor canWrite: self)
]

{ #category : #tests }
MAChainAccessorTest >> testKind [
	self assert: self accessor class equals: MAChainAccessor.
	self assert: self accessor accessor class equals: MASelectorAccessor.
	self assert: self accessor next class equals: MAChainAccessor.
	self assert: self accessor next accessor class equals: MASelectorAccessor.
	self assert: self accessor next next class equals: MASelectorAccessor
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
	self assert: self accessor accessor selector equals: #holder.
	self assert: self accessor next accessor selector equals: #contents.
	self assert: self accessor next next selector equals: #value
]

{ #category : #tests }
MAChainAccessorTest >> testWrite [
	self accessor write: 123 to: self.
	self assert: self value = 123.

	self accessor write: '123' to: self.
	self assert: self value = '123'
]
