"
I access an MAObject's properties.

Note that my lineage might a bit confusing because my superclass is used when a model object *is* a dictionary, but I access a dictionary *contained by* a model object.
"
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
