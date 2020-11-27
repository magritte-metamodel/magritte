Class {
	#name : #MAPluggableAccessorTest,
	#superclass : #MAAccessorTest,
	#category : 'Magritte-Tests-Model-Accessor'
}

{ #category : #testing }
MAPluggableAccessorTest class >> isAbstract [
	^ false
]

{ #category : #private }
MAPluggableAccessorTest >> accessorInstance [
	^ self actualClass
		read: [ :model | model value ]
		write: [ :model :object | model value: object ]
]

{ #category : #private }
MAPluggableAccessorTest >> actualClass [
	^ MAPluggableAccessor
]

{ #category : #'tests-testing' }
MAPluggableAccessorTest >> testCanRead [
	self assert: (self instance canRead: self).
	self instance readBlock: nil.
	self deny: (self instance canRead: self)
]

{ #category : #'tests-testing' }
MAPluggableAccessorTest >> testCanWrite [
	self assert: (self instance canWrite: nil).
	self assert: (self instance canWrite: 123).
	self assert: (self instance canWrite: self).

	self instance writeBlock: nil.
	self deny: (self instance canWrite: nil).
	self deny: (self instance canWrite: 123).
	self deny: (self instance canWrite: self)
]

{ #category : #tests }
MAPluggableAccessorTest >> testRead [
	self value: 123.
	self assert: (self accessor read: self) = 123.

	self value: '12'.
	self assert: (self accessor read: self) = '12'
]

{ #category : #tests }
MAPluggableAccessorTest >> testReadBlock [
	self accessor readBlock: [ :model |
		self assert: model = self. 123 ].
	self assert: (self accessor read: self) = 123
]

{ #category : #'tests-identity' }
MAPluggableAccessorTest >> testStore [
	"The class BlockContext is not serializeable, ignore this test."
]

{ #category : #tests }
MAPluggableAccessorTest >> testWrite [
	self accessor write: 123 to: self.
	self assert: self value = 123.

	self accessor write: '123' to: self.
	self assert: self value = '123'
]

{ #category : #tests }
MAPluggableAccessorTest >> testWriteBlock [
	self accessor writeBlock: [ :model :object |
		self assert: model = self.
		self assert: object = 123 ].
	self accessor write: 123 to: self
]
