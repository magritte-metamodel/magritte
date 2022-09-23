"
!Responsibilities
I am an abstract memento. I am a stand-in for an object, typically for reading and writing. Subclasses ''may'' save the pre-operation state (e.g. ${class:MACachedMemento}$), or ''may not'' (e.g. ${class:MAStraightMemento}$. Similarly, they ''may'' verify described conditions are met (e.g. ${class:MACheckedMemento}$). NB. My behavior is different than a GoF ==Memento==, which is immutable, saving an object's state before it's modified by an operation.
!Collaborators
- the ==model== I represent/modify
- the ==description== currently used to describe this ==model==
"
Class {
	#name : #MAMemento,
	#superclass : #MAObject,
	#instVars : [
		'model',
		'description'
	],
	#category : #'Magritte-Model-Memento'
}

{ #category : #'instance creation' }
MAMemento class >> model: aModel [
	^ self model: aModel description: aModel magritteDescription
]

{ #category : #'instance creation' }
MAMemento class >> model: aModel description: aDescription [
	^ self new
		setModel: aModel;
		setDescription: aDescription;
		reset; yourself
]

{ #category : #actions }
MAMemento >> commit [
	"Commit the receiver into the model."
]

{ #category : #private }
MAMemento >> cookRawPull: aDictionary [

	aDictionary keysAndValuesDo: [ :key :value |
		value isNil
			ifTrue: [ aDictionary at: key put: key default yourself ] ]
]

{ #category : #'reflective operations' }
MAMemento >> doesNotUnderstand: aMessage [
  ^ self magritteDescription children 
  	detect: [ :desc | desc handlesSelector: aMessage selector ] 
  	ifFound: [ :desc | desc handleMessage: aMessage for: self ]
  	ifNone: [ super doesNotUnderstand: aMessage ]
]

{ #category : #private }
MAMemento >> isDifferent: firstDictionary to: secondDictionary [
	| firstValue secondValue |
	self magritteDescription do: [ :each |
		(each isVisible and: [ each isReadOnly not ]) ifTrue: [
			firstValue := firstDictionary at: each ifAbsent: [ nil ].
			secondValue := secondDictionary at: each ifAbsent: [ nil ].
			firstValue = secondValue ifFalse: [ ^ true ] ] ].
	^ false
]

{ #category : #accessing }
MAMemento >> magritteDescription [
	"`#modelDescription` would probably be clearer, but we want to be polymorphic (see implementors)"
	^ description
]

{ #category : #accessing }
MAMemento >> model [
	^ model
]

{ #category : #printing }
MAMemento >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' model: '; print: self model
]

{ #category : #private }
MAMemento >> pull [
	"Utility method to pull the model into a dictionary mapping descriptions to values. nil values are replaced with the default ones of the model."

	| result |
	result := self pullRaw.
	self cookRawPull: result.
	^ result
]

{ #category : #private }
MAMemento >> pullRaw [
	| result |
	result := Dictionary new.
	self magritteDescription do: [ :each |
		| value |
		value := self model readUsing: each.
		result at: each put: value copy "see implementation note" ].
	^ result
	
	"Implementation note: We copy the field values because checked mementos compare the `original` pull to the current object to see if it has changed elsewhere. Unless we make a copy each time, this comparison would not be possible for complex objects, because any changes to them from outside will be reflected equally in the `original` dictionary. E.g. if `original at: #person == self model person` and outside someone does `self model person age: 25`, the check above would pass even though it should fail."
]

{ #category : #private }
MAMemento >> push: aDictionary [
	"Utility method to push a dictionary mapping descriptions to values into the model."

	aDictionary keysAndValuesDo: [ :key :value |
		(self shouldPush: value using: key) 
			ifTrue: [ self model write: value using: key ] ]
]

{ #category : #private }
MAMemento >> readModelUsing: aDescription [
	^ self model readUsing: aDescription
]

{ #category : #private }
MAMemento >> readUsing: aDescription [
	^ self subclassResponsibility
]

{ #category : #actions }
MAMemento >> reset [
	"Reset the memento from the model."
]

{ #category : #initialization }
MAMemento >> setDescription: aDescription [
	description := aDescription
]

{ #category : #initialization }
MAMemento >> setModel: aModel [
	model := aModel
]

{ #category : #'private-testing' }
MAMemento >> shouldPush: anObject using: aDescription [
	^ aDescription isVisible and: [ aDescription isReadOnly not ]
]

{ #category : #actions }
MAMemento >> validate [
	"Check if the data in the receiver would be valid if committed. In case of problems an exception is raised."

	self magritteDescription validate: self
]
