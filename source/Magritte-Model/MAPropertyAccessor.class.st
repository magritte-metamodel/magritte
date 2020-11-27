Class {
	#name : #MAPropertyAccessor,
	#superclass : #MADictionaryAccessor,
	#category : #'Magritte-Model-Accessor'
}

{ #category : #model }
MAPropertyAccessor >> read: aModel [
	^ aModel propertyAt: self key ifAbsent: [ nil ]
]

{ #category : #model }
MAPropertyAccessor >> write: anObject to: aModel [
	aModel propertyAt: self key put: anObject
]
