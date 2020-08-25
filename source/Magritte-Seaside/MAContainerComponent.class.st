Class {
	#name : #MAContainerComponent,
	#superclass : #MADescriptionComponent,
	#instVars : [
		'children',
		'readonly',
		'errors',
		'magritteDescription'
	],
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MAContainerComponent class >> isAbstract [
	^ false
]

{ #category : #decorating }
MAContainerComponent >> addForm [
	self addForm: #( save cancel )
]

{ #category : #decorating }
MAContainerComponent >> addForm: aCollection [
	self addDecoration: (MAFormDecoration buttons: aCollection)
]

{ #category : #decorating }
MAContainerComponent >> addSwitch [
	self addDecoration: MASwitchDecoration new.
	self readonly: true
]

{ #category : #decorating }
MAContainerComponent >> addValidatedForm [
	self addForm; addValidation
]

{ #category : #decorating }
MAContainerComponent >> addValidatedForm: aCollection [
	self addForm: aCollection; addValidation
]

{ #category : #decorating }
MAContainerComponent >> addValidatedSwitch [
	self addSwitch; addValidation
]

{ #category : #decorating }
MAContainerComponent >> addValidation [
	self addDecoration: MAValidationDecoration new
]

{ #category : #private }
MAContainerComponent >> buildChildren [
	^ self magritteDescription
		inject: Dictionary new
		into: [ :result :each |
			each isVisible ifTrue: [
				result at: each put: (each componentClass
					memento: self memento description: each parent: self) ].
			result ]
]

{ #category : #actions }
MAContainerComponent >> cancel [
	self reset; answer: nil
]

{ #category : #accessing }
MAContainerComponent >> childAt: aDescription [
	^ children at: aDescription ifAbsent: [ nil ]
]

{ #category : #accessing }
MAContainerComponent >> children [
	^ children values
]

{ #category : #actions }
MAContainerComponent >> commit [
	self withContainersDo: [ :each | each commitMemento ]
]

{ #category : #actions }
MAContainerComponent >> commitMemento [
	self memento commit
]

{ #category : #private }
MAContainerComponent >> doValidateTo: aCollectionOfErrors [
	self 
		onValidationError: [ self memento validate ] 
		addTo: aCollectionOfErrors.
	self children do: [ :each | 
		self 
			onValidationError: [ each doValidateTo: aCollectionOfErrors ]
			addTo: aCollectionOfErrors ]
]

{ #category : #actions }
MAContainerComponent >> edit [
	self readonly: false
]

{ #category : #accessing }
MAContainerComponent >> errors [
	"Answer a collection of exceptions, the list of standing errors."

	^ errors
]

{ #category : #initialization }
MAContainerComponent >> initialize [
	super initialize.
	errors := OrderedCollection new
]

{ #category : #testing }
MAContainerComponent >> isMagritteContainer [
	^ true
]

{ #category : #testing }
MAContainerComponent >> isReadonly [
	^ super isReadonly or: [ self readonly ]
]

{ #category : #accessing }
MAContainerComponent >> magritteDescription [
	^magritteDescription ifNil: [
		| model builder |
		builder := description descriptionBuilder.
		builder ifNil: [ ^description]. 
		model := self model.
		magritteDescription := builder buildFrom: description target: model model: self model model.
		self setMemento: (model mementoClass model: model description: magritteDescription).
		magritteDescription ]
]

{ #category : #'accessing-properties' }
MAContainerComponent >> readonly [
	^ readonly ifNil: [ readonly := false ]
]

{ #category : #'accessing-properties' }
MAContainerComponent >> readonly: aBoolean [
	readonly := aBoolean
]

{ #category : #rendering }
MAContainerComponent >> renderContentOn: html [
	self magritteDescription componentRenderer
		component: self on: html
]

{ #category : #actions }
MAContainerComponent >> reset [
	self withContainersDo: [ :each | each memento reset ]
]

{ #category : #actions }
MAContainerComponent >> save [
	self validate ifFalse: [ ^ self ].
	self commit; answer: self model
]

{ #category : #initialization }
MAContainerComponent >> setChildren: aDictionary [
	children := aDictionary
]

{ #category : #initialization }
MAContainerComponent >> setDescription: aDescription [
	magritteDescription := nil.
	super setDescription: aDescription.
	self setChildren: self buildChildren
]

{ #category : #actions }
MAContainerComponent >> validate [
	errors := OrderedCollection new.
	self withContainersDo: [ :each | each doValidateTo: errors ].
	^ errors isEmpty
]

{ #category : #private }
MAContainerComponent >> withContainersDo: aBlock [
	"This does a depth first search through all children and evaluates a block for all container components that have their own memento."
	
	self withContainersDo: aBlock in: self
]

{ #category : #private }
MAContainerComponent >> withContainersDo: aBlock in: aComponent [
	"This does a depth first search through all children and evaluates a block for all container components that have their own memento."
	
	aComponent childrenDo: [ :each |
		self withContainersDo: aBlock in: each ].
	aComponent isMagritteContainer
		ifTrue: [ aBlock value: aComponent ]
]
