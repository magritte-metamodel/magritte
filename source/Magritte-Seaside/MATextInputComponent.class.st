"
I'm a simple input box for MAStringDescription.
"
Class {
	#name : #MATextInputComponent,
	#superclass : #MAElementComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MATextInputComponent class >> isAbstract [
	^ false
]

{ #category : #testing }
MATextInputComponent >> hasLabelId [
	^ self isReadonly not
]

{ #category : #rendering }
MATextInputComponent >> renderButtonOn: html [
]

{ #category : #rendering }
MATextInputComponent >> renderEditorOn: html [
	self renderInputOn: html.
	self renderButtonOn: html
]

{ #category : #rendering }
MATextInputComponent >> renderInputOn: html [
	html textInput
		id: self labelId;
		on: #string of: self
]
