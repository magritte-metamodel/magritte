Class {
	#name : #MANullAccessorTest,
	#superclass : #MAAccessorTest,
	#category : 'Magritte-Tests-Model-Accessor'
}

{ #category : #testing }
MANullAccessorTest class >> isAbstract [
	^ false
]

{ #category : #private }
MANullAccessorTest >> accessorInstance [
	^ self actualClass new
]

{ #category : #private }
MANullAccessorTest >> actualClass [
	^ MANullAccessor
]

{ #category : #'tests-identity' }
MANullAccessorTest >> testAsAccessor [
	super testAsAccessor.
	self assert: (nil asAccessor isKindOf: self actualClass)
]

{ #category : #'tests-testing' }
MANullAccessorTest >> testCanRead [
	self deny: (self accessor canRead: self)
]

{ #category : #'tests-testing' }
MANullAccessorTest >> testCanWrite [
	self deny: (self accessor canWrite: nil)
]

{ #category : #tests }
MANullAccessorTest >> testRead [
	self
		should: [ self accessor read: self ]
		raise: MAReadError
]

{ #category : #tests }
MANullAccessorTest >> testWrite [
	self
		should: [ self accessor write: 123 to: self ]
		raise: MAWriteError.
	self assert: self value isNil
]
