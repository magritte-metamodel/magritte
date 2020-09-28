"
Password seaside component, I display stars '*' instead of the text typed by the user. My description is MAPasswordDescription.
"
Class {
	#name : #MATextPasswordComponent,
	#superclass : #MAElementComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MATextPasswordComponent class >> isAbstract [
	^ false
]

{ #category : #testing }
MATextPasswordComponent >> hasLabelId [
	^ self isReadonly not
]

{ #category : #rendering }
MATextPasswordComponent >> renderEditorOn: html [
	html passwordInput
		id: self labelId;
		on: #string of: self
]

{ #category : #accessing }
MATextPasswordComponent >> string [
	^ self magritteDescription obfuscated: super string
]

{ #category : #accessing }
MATextPasswordComponent >> string: aString [
	(self magritteDescription isObfuscated: aString)
		ifFalse: [ super string: aString ]
]
