"
I am a normally invisible component. I show a list of validation errors in case the owner component fails to validate.
"
Class {
	#name : #MAValidationDecoration,
	#superclass : #MAComponentDecoration,
	#category : 'Magritte-Seaside-Decorations'
}

{ #category : #accessing }
MAValidationDecoration >> errors [
	^ self decoratedComponent errors
]

{ #category : #rendering }
MAValidationDecoration >> renderContentOn: html [
	self errors isEmpty
		ifFalse: [ self renderErrorsOn: html ].
	super renderContentOn: html
]

{ #category : #rendering }
MAValidationDecoration >> renderErrorsOn: html [
	html unorderedList
		class: 'errors';
		list: self errors;
		with: nil
]
