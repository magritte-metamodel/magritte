Class {
	#name : #MAVerifiedPasswordComponent,
	#superclass : #MATextPasswordComponent,
	#instVars : [
		'verificationValue'
	],
	#category : 'Magritte-Seaside-Components'
}

{ #category : #private }
MAVerifiedPasswordComponent >> doValidateTo: aCollectionOfErrors [
	self value = verificationValue
		ifTrue: [ super doValidateTo: aCollectionOfErrors ]
		ifFalse: [ aCollectionOfErrors add: (MAConditionError description: self magritteDescription signal: 'Your passwords do not match') ]
]

{ #category : #rendering }
MAVerifiedPasswordComponent >> renderEditorOn: html [
	super renderEditorOn: html.
	html break.
	html passwordInput
		class: 'verification';
		on: #verificationString of: self
]

{ #category : #initialization }
MAVerifiedPasswordComponent >> setDescription: aDescription [
	super setDescription: aDescription.
	self verificationValue: self value
]

{ #category : #accessing }
MAVerifiedPasswordComponent >> verificationString [
	^ self magritteDescription obfuscated: self verificationValue
]

{ #category : #accessing }
MAVerifiedPasswordComponent >> verificationString: aString [
	| value |
	(self magritteDescription isObfuscated: aString)
		ifTrue: [ ^ self ].
	value := [ self magritteDescription fromString: aString ]
		on: Error do: [ :e | e return: aString ].
	self verificationValue: value
]

{ #category : #accessing }
MAVerifiedPasswordComponent >> verificationValue [
	^ verificationValue
]

{ #category : #accessing }
MAVerifiedPasswordComponent >> verificationValue: anObject [
	verificationValue := anObject
]
