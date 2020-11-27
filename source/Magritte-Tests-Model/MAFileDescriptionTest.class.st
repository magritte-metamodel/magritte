Class {
	#name : #MAFileDescriptionTest,
	#superclass : #MAElementDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #testing }
MAFileDescriptionTest class >> isAbstract [
	^ false
]

{ #category : #private }
MAFileDescriptionTest >> actualClass [
	^ MAFileDescription
]

{ #category : #private }
MAFileDescriptionTest >> includedInstance [
	^ MAMemoryFileModel new
		contents: 'Lukas Renggli';
		filename: 'author.txt';
		yourself
]

{ #category : #private }
MAFileDescriptionTest >> shouldSkipStringTests [
	^ true
]

{ #category : #'tests-accessing' }
MAFileDescriptionTest >> testKind [
	super testKind.
	self description kind: MAFileModelStub.
	self assert: self description kind = MAFileModelStub
]
