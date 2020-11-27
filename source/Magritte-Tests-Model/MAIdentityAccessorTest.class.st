Class {
	#name : #MAIdentityAccessorTest,
	#superclass : #MAAccessorTest,
	#category : 'Magritte-Tests-Model-Accessor'
}

{ #category : #testing }
MAIdentityAccessorTest class >> isAbstract [
	^ false
]

{ #category : #private }
MAIdentityAccessorTest >> accessorInstance [
	^ self actualClass new
]

{ #category : #private }
MAIdentityAccessorTest >> actualClass [
	^ MAIdentityAccessor
]

{ #category : #'tests-testing' }
MAIdentityAccessorTest >> testCanRead [
	self assert: (self accessor canRead: self)
]

{ #category : #'tests-testing' }
MAIdentityAccessorTest >> testCanWrite [
	self deny: (self accessor canWrite: self)
]

{ #category : #tests }
MAIdentityAccessorTest >> testRead [
	self assert: (self accessor read: 123) = 123
]

{ #category : #tests }
MAIdentityAccessorTest >> testWrite [
	self
		should: [ self accessor write: 123 to: self ]
		raise: MAWriteError.
	self assert: self value isNil
]
