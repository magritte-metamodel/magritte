Class {
	#name : #MAMemoDescriptionTest,
	#superclass : #MAStringDescriptionTest,
	#category : 'Magritte-Tests-Model-Description'
}

{ #category : #private }
MAMemoDescriptionTest >> actualClass [
	^ MAMemoDescription
]

{ #category : #'tests-properties' }
MAMemoDescriptionTest >> testLineCount [
	self description lineCount: 123.
	self assert: self description lineCount = 123
]
