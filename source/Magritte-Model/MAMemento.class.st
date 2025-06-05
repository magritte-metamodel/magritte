"
!Responsibilities
I am an abstract memento. I am a stand-in for an object, typically for reading and writing. Subclasses ''may'' save the pre-operation state (e.g. ${class:MACachedMemento}$), or ''may not'' (e.g. ${class:MAStraightMemento}$. Similarly, they ''may'' verify described conditions are met (e.g. ${class:MACheckedMemento}$). NB. My behavior is different than a GoF ==Memento==, which is immutable, saving an object's state before it's modified by an operation.
!Collaborators
- the ==model== I represent/modify
- the ==description== currently used to describe this ==model==
"
Class {
	#name : 'MAMemento',
	#superclass : 'MAObject',
	#instVars : [
		'model',
		'description'
	],
	#category : 'Magritte-Model-Memento'
}

{ #category : 'instance creation' }
MAMemento class >> model: aModel [
	^ self model: aModel description: aModel magritteDescription
]

{ #category : 'instance creation' }
MAMemento class >> model: aModel description: aDescription [
	^ self new
		setModel: aModel;
		setDescription: aDescription;
		reset; yourself
]

{ #category : 'actions' }
MAMemento >> commit [
	"Commit the receiver into the model."
]

{ #category : 'private' }
MAMemento >> cookRawPull: aDictionary [
	"The reason for the somewhat cryptic message name is that each subclass is free to perform any needed actions. Here we just replace undefinedValues with default values"

	aDictionary keysAndValuesDo: [ :elemDescription :value |
		value = elemDescription undefinedValue ifTrue: [ 
			aDictionary 
				at: elemDescription 
				put: elemDescription default ] ]
]

{ #category : 'reflective operations' }
MAMemento >> doesNotUnderstand: aMessage [
  ^ self magritteDescription children 
  	detect: [ :desc | desc handlesSelector: aMessage selector ] 
  	ifFound: [ :desc | desc handleMessage: aMessage for: self ]
  	ifNone: [ super doesNotUnderstand: aMessage ]
]

{ #category : 'private' }
MAMemento >> has: firstDictionary changedFrom: secondDictionary [
	
	self magritteDescription do: [ :desc |
		| firstValue secondValue hasFieldChanged |
		firstValue := firstDictionary at: desc ifAbsent: [ nil ].
		secondValue := secondDictionary at: desc ifAbsent: [ nil ].
		hasFieldChanged := desc shouldWrite: firstValue over: secondValue.
		hasFieldChanged ifTrue: [ ^ true ] ].
	^ false
]

{ #category : 'accessing' }
MAMemento >> magritteDescription [
	"`#modelDescription` would probably be clearer, but we want to be polymorphic (see implementors)"
	^ description
]

{ #category : 'accessing' }
MAMemento >> model [
	^ model
]

{ #category : 'printing' }
MAMemento >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' model: '; print: self model
]

{ #category : 'private' }
MAMemento >> pull [
	"Utility method to pull the model into a dictionary mapping descriptions to values. nil values are replaced with the default ones of the model."

	| result |
	result := self pullRaw.
	self cookRawPull: result.
	^ result
]

{ #category : 'private' }
MAMemento >> pullRaw [
	
	^ self pullRawTransforming: [ :e | e ]
]

{ #category : 'private' }
MAMemento >> pullRawTransforming: aBlock [
	| result |
	result := Dictionary new.
	self magritteDescription do: [ :elemDescription |
		| value transformedValue |
		value := self model readUsing: elemDescription.
		transformedValue := aBlock cull: value cull: elemDescription.
		result at: elemDescription put: transformedValue ].
	^ result
]

{ #category : 'private' }
MAMemento >> push: aDictionary [
	"Utility method to push a dictionary mapping descriptions to values into the model."

	aDictionary keysAndValuesDo: [ :key :value |
		(self shouldPush: value using: key) 
			ifTrue: [ self model write: value using: key ] ]
]

{ #category : 'private' }
MAMemento >> readUsing: aDescription [
	^ self subclassResponsibility
]

{ #category : 'actions' }
MAMemento >> reset [
	"Reset the memento from the model."
]

{ #category : 'initialization' }
MAMemento >> setDescription: aDescription [
	description := aDescription
]

{ #category : 'initialization' }
MAMemento >> setModel: aModel [
	model := aModel
]

{ #category : 'private-testing' }
MAMemento >> shouldPush: anObject using: aDescription [

	| modelValue |
	modelValue := self model readUsing: aDescription.
	^ aDescription shouldWrite: anObject over: modelValue.
]

{ #category : 'actions' }
MAMemento >> validate [
	"Check if the data in the receiver would be valid if committed. In case of problems an exception is raised."

	self magritteDescription validate: self
]
