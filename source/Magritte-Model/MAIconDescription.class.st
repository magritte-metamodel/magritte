Class {
	#name : #MAIconDescription,
	#superclass : #MAElementDescription,
	#instVars : [
		'iconNameAccessor'
	],
	#category : #'Magritte-Model-Description'
}

{ #category : #accessing }
MAIconDescription >> iconNameAccessor [
	^ iconNameAccessor
]

{ #category : #accessing }
MAIconDescription >> iconNameAccessor: anObject [
	iconNameAccessor := anObject
]
