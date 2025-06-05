Trait {
	#name : 'MATContainerPresenter',
	#instVars : [
		'children',
		'answerBlock'
	],
	#category : 'Magritte-UI'
}

{ #category : 'decorating' }
MATContainerPresenter >> addButtons [
	self addButtons: #( save cancel )
]

{ #category : 'decorating' }
MATContainerPresenter >> addButtons: anArray [
	self subclassResponsibility
]

{ #category : 'answering' }
MATContainerPresenter >> answer: anObject [

	| didUserCancel |
	self onCancel.
	
	didUserCancel := anObject isNil.
	didUserCancel | answerBlock isNil ifTrue: [ ^ self ].

	answerBlock value: anObject.
]

{ #category : 'actions' }
MATContainerPresenter >> cancel [
	self reset; answer: nil
]

{ #category : 'accessing' }
MATContainerPresenter >> children [
	^ children
]

{ #category : 'actions' }
MATContainerPresenter >> commit [
	self memento commit
]

{ #category : 'actions' }
MATContainerPresenter >> force [
	self commit; answer: self model
]

{ #category : 'actions' }
MATContainerPresenter >> save [
	[ self validate ]
		on: MAValidationError
		do: [ :err | ^ self inform: err greaseString ].
	self commit; answer: self model
]

{ #category : 'initialization' }
MATContainerPresenter >> setChildren: aCollection [
	children := aCollection
]

{ #category : 'initialization' }
MATContainerPresenter >> setDescription: aDescription [
	super setDescription: aDescription.
	self setChildren: self buildChildren
]

{ #category : 'actions' }
MATContainerPresenter >> validate [
	self memento validate
]
