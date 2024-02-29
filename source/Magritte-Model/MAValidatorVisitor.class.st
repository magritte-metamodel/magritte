Class {
	#name : #MAValidatorVisitor,
	#superclass : #MAVisitor,
	#instVars : [
		'object'
	],
	#category : #'Magritte-Model-Visitor'
}

{ #category : #'instance creation' }
MAValidatorVisitor class >> on: anObject description: aDescription [
	^ self new on: anObject description: aDescription
]

{ #category : #accessing }
MAValidatorVisitor >> object [
	"Answer the currently validated object."

	^ object
]

{ #category : #initialization }
MAValidatorVisitor >> on: anObject description: aDescription [
	self use: anObject during: [ self visit: aDescription ]
]

{ #category : #private }
MAValidatorVisitor >> use: anObject during: aBlock [
	| previous |
	previous := object. object := anObject.
	^ aBlock ensure: [ object := previous ]
]

{ #category : #private }
MAValidatorVisitor >> validate: anObject using: aDescription [
	aDescription validateRequired: anObject.
	anObject = aDescription undefinedValue ifTrue: [ ^ self ].
	aDescription
		tryValidation: [ aDescription validateKind: anObject ]
		ifPass: [ 
			aDescription
				validateSpecific: anObject;
				validateConditions: anObject ]
		
]

{ #category : #visiting }
MAValidatorVisitor >> visit: aDescription [
	"Only visit objects that are visible and that can be changed."
	
	| errors |
	(aDescription isVisible and: [ aDescription isReadOnly not ])
		ifFalse: [ ^ self ].

	errors := OrderedCollection new.
	[ 
		super visit: aDescription
	]
		on: MAValidationError
		do: [ :err | 
			errors add: err. 
			err resume ].
		
	errors isEmpty ifFalse: [
		MAMultipleErrors
			description: aDescription 
			errors: errors
			signal: aDescription label ]
]

{ #category : #'visiting-descriptions' }
MAValidatorVisitor >> visitContainer: aDescription [
	
	super visitContainer: aDescription.
	self object ifNotNil: [ :obj |
		aDescription do: [ :description |
			self
				use: (obj readUsing: description)
				during: [ self visit: description ] ] ]
]

{ #category : #'visiting-descriptions' }
MAValidatorVisitor >> visitDescription: aDescription [
	self validate: self object using: aDescription
]
