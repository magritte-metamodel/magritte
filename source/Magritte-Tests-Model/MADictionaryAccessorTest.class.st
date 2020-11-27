Class {
	#name : #MADictionaryAccessorTest,
	#superclass : #MAAccessorTest,
	#category : 'Magritte-Tests-Model-Accessor'
}

{ #category : #testing }
MADictionaryAccessorTest class >> isAbstract [
	^ false
]

{ #category : #private }
MADictionaryAccessorTest >> accessorInstance [
	^ self actualClass key: #value
]

{ #category : #private }
MADictionaryAccessorTest >> actualClass [
	^ MADictionaryAccessor
]

{ #category : #accessing }
MADictionaryAccessorTest >> at: aKey ifAbsent: aBlock [
	^ aKey = #value 
		ifTrue: [ value ]
		ifFalse: [ aBlock value ]
]

{ #category : #accessing }
MADictionaryAccessorTest >> at: aKey put: aValue [
	self assert: aKey = #value.
	^ value := aValue
]

{ #category : #'tests-testing' }
MADictionaryAccessorTest >> testCanRead [
	self assert: (self accessor canRead: self).
	self accessor key: #zork.
	self assert: (self accessor canRead: self)
]

{ #category : #'tests-testing' }
MADictionaryAccessorTest >> testCanWrite [
	self assert: (self accessor canWrite: self)
]

{ #category : #tests }
MADictionaryAccessorTest >> testKey [
	self accessor key: #other.
	self assert: self accessor key = #other
]

{ #category : #tests }
MADictionaryAccessorTest >> testRead [
	self value: 123.
	self assert: (self accessor read: self) = 123.

	self value: '12'.
	self assert: (self accessor read: self) = '12'
]

{ #category : #tests }
MADictionaryAccessorTest >> testWrite [
	self accessor write: 123 to: self.
	self assert: self value = 123.

	self accessor write: '123' to: self.
	self assert: self value = '123'
]
