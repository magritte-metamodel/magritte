Class {
	#name : #MAVariableAccessorTest,
	#superclass : #MAAccessorTest,
	#category : 'Magritte-Tests-Model-Accessor'
}

{ #category : #testing }
MAVariableAccessorTest class >> isAbstract [
	^ false
]

{ #category : #private }
MAVariableAccessorTest >> accessorInstance [
	^ self actualClass name: 'value'
]

{ #category : #private }
MAVariableAccessorTest >> actualClass [
	^ MAVariableAccessor
]

{ #category : #'tests-testing' }
MAVariableAccessorTest >> testCanRead [
	self assert: (self accessor canRead: self).

	self accessor name: 'zork'.
	self deny: (self accessor canRead: self)
]

{ #category : #'tests-testing' }
MAVariableAccessorTest >> testCanWrite [
	self assert: (self accessor canWrite: self).

	self accessor name: 'zork'.
	self deny: (self accessor canWrite: self)
]

{ #category : #tests }
MAVariableAccessorTest >> testName [
	self accessor name: 'other'.
	self assert: self accessor name = 'other'
]

{ #category : #tests }
MAVariableAccessorTest >> testRead [
	self value: 123.
	self assert: (self accessor read: self) = 123.

	self value: '12'.
	self assert: (self accessor read: self) = '12'
]

{ #category : #tests }
MAVariableAccessorTest >> testWrite [
	self accessor write: 123 to: self.
	self assert: self value = 123.

	self accessor write: '123' to: self.
	self assert: self value = '123'
]
