Class {
	#name : #MAReferenceDescriptionTest,
	#superclass : #MAElementDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MAReferenceDescriptionTest class >> isAbstract [
	^ true
]

{ #category : #private }
MAReferenceDescriptionTest >> actualClass [
	^ MAReferenceDescription
]

{ #category : #private }
MAReferenceDescriptionTest >> referenceInstance [
	^ MAStringDescription new
]

{ #category : #running }
MAReferenceDescriptionTest >> setUp [
	super setUp.
	self description reference: self referenceInstance.
	self assert: self description reference accessor notNil
]

{ #category : #'tests-copying' }
MAReferenceDescriptionTest >> testCopyReference [
	self assert: self description copy reference = self description reference.
	self deny: self description copy reference == self description reference
]
