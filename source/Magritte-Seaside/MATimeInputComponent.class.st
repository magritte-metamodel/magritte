Class {
	#name : #MATimeInputComponent,
	#superclass : #MATextInputComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #actions }
MATimeInputComponent >> now [
	self value: Time now
]

{ #category : #rendering }
MATimeInputComponent >> renderButtonOn: html [
	html submitButton on: #now of: self
]
