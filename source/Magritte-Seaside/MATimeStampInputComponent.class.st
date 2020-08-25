Class {
	#name : #MATimeStampInputComponent,
	#superclass : #MATextInputComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #actions }
MATimeStampInputComponent >> current [
	self value: GRPlatform current magritteTimeStampClass current
]

{ #category : #rendering }
MATimeStampInputComponent >> renderButtonOn: html [
	html submitButton on: #current of: self
]
