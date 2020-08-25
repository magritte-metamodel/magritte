"
I'm a seaside object which provides all the functions for my subclasses to display MADescription subclasses.
"
Class {
	#name : #MADescriptionComponent,
	#superclass : #MAComponent,
	#instVars : [
		'memento',
		'description',
		'parent'
	],
	#category : 'Magritte-Seaside-Components'
}

{ #category : #'instance creation' }
MADescriptionComponent class >> memento: aMemento [
	^ self memento: aMemento description: aMemento magritteDescription
]

{ #category : #'instance creation' }
MADescriptionComponent class >> memento: aMemento description: aDescription [
	^ self memento: aMemento description: aDescription parent: nil
]

{ #category : #'instance creation' }
MADescriptionComponent class >> memento: aMemento description: aDescription parent: aComponent [
	^ self new
		setMemento: aMemento;
		setDescription: aDescription;
		setParent: aComponent;
		yourself
]

{ #category : #accessing }
MADescriptionComponent >> attributes [
	self 
		greaseDeprecatedApi: 'MADescriptionComponent>>#attributes'
		details: '#attributes is not supported anymore.'.
	^ WAHtmlAttributes new
]

{ #category : #private }
MADescriptionComponent >> doValidateTo: aCollectionOfErrors [
	"Enables components to raise errors when the model is validated."
]

{ #category : #'accessing-dynamic' }
MADescriptionComponent >> id [
	^ self class name asLowercase , self hash greaseString
]

{ #category : #testing }
MADescriptionComponent >> isReadonly [
	^ self magritteDescription isReadonly
		or: [ self isRoot not
		and: [ self parent isReadonly ] ]
]

{ #category : #testing }
MADescriptionComponent >> isRoot [
	^ self parent isNil
]

{ #category : #accessing }
MADescriptionComponent >> labelId [
	"Accessor that returns the an id that can be reference by a <label>-tag."

	^ self ajaxId: 'label'
]

{ #category : #accessing }
MADescriptionComponent >> magritteDescription [
	^ description
]

{ #category : #accessing }
MADescriptionComponent >> memento [
	^ memento
]

{ #category : #'accessing-dynamic' }
MADescriptionComponent >> model [
	^ self memento model
]

{ #category : #private }
MADescriptionComponent >> onValidationError: aBlock addTo: aCollection [
	^ [ aBlock
		on: MAMultipleErrors do: [ :err | aCollection addAll: err collection ] ]
		on: MAValidationError do: [ :err | aCollection add: err ]
]

{ #category : #accessing }
MADescriptionComponent >> parent [
	^ parent
]

{ #category : #'accessing-dynamic' }
MADescriptionComponent >> root [
	^ self isRoot
		ifTrue: [ self ]
		ifFalse: [ self parent root ]
]

{ #category : #initialization }
MADescriptionComponent >> setDescription: aDescription [
	description := aDescription
]

{ #category : #initialization }
MADescriptionComponent >> setMemento: aMemento [
	memento := aMemento
]

{ #category : #initialization }
MADescriptionComponent >> setParent: aComponent [
	parent := aComponent
]
