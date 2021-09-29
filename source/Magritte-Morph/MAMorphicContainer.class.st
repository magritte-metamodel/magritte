Class {
	#name : #MAMorphicContainer,
	#superclass : #MAMorphicDescription,
	#instVars : [
		'children',
		'answerBlock'
	],
	#category : #'Magritte-Morph-Model'
}

{ #category : #decorating }
MAMorphicContainer >> addButtons [
	self addButtons: #( save cancel )
]

{ #category : #decorating }
MAMorphicContainer >> addButtons: anArray [
	morph := self rectangleMorph
		addMorphBack: self morph;
		addMorphBack: (self barMorph: anArray);
		yourself
]

{ #category : #decorating }
MAMorphicContainer >> addWindow [
	| scrollPane newMorph |
	scrollPane := GeneralScrollPane new.
	newMorph := self morph 
		vResizing: #spaceFill;
		hResizing: #spaceFill.
	scrollPane changeScrollerTableLayout; scrollTarget: newMorph.	


	morph := self windowMorph
		model: self;
		vResizing: #shrinkWrap;
		addMorph: (scrollPane layoutInset: 5 @ 5)
			frame: (0 @ 0 corner: 1 @ 1);
		yourself
]

{ #category : #answering }
MAMorphicContainer >> answer: anObject [

	| didUserCancel |
	self morph delete.
	
	didUserCancel := anObject isNil.
	didUserCancel | answerBlock isNil ifTrue: [ ^ self ].

	answerBlock value: anObject.
]

{ #category : #private }
MAMorphicContainer >> buildChildren [
	^ Array streamContents: [ :stream |
		self magritteDescription do: [ :each |
			each isVisible ifTrue: [
				stream nextPut: (each morphicClass
					memento: self memento
					description: each
					parent: self) ] ] ]
]

{ #category : #private }
MAMorphicContainer >> buildMorphViewOn: aMorph [

	| toolbar |
	aMorph
		listDirection: #topToBottom;
		cellInset: 3.
	self children do: [ :each |
		aMorph addMorphBack: each morph ].
	toolbar := self rectangleMorph
		listDirection: #leftToRight;
		cellInset: 4@0;
		layoutInset: 4@4;
		yourself.
	self model magritteActionButtons do: [ :e | toolbar addMorphBack: e ].
	aMorph addMorphBack: toolbar.
		
]

{ #category : #morphic }
MAMorphicContainer >> callInHand [
	| result |
	result := nil.
	self onAnswer: [ :value | result := value ].
	self openInHand; waitUntilClosed.
	^ result
]

{ #category : #morphic }
MAMorphicContainer >> callInWorld [
	| result |
	result := nil.
	self onAnswer: [ :value | result := value ].
	self openInWorld; waitUntilClosed.
	^ result
]

{ #category : #actions }
MAMorphicContainer >> cancel [
	self reset; answer: nil
]

{ #category : #accessing }
MAMorphicContainer >> children [
	^ children
]

{ #category : #'error handling' }
MAMorphicContainer >> doesNotUnderstand: aMessage [
	"Forward callbacks from #addButtons: to the model if appropriate"

	(self model respondsTo: aMessage selector)
		ifTrue: [ self model perform: aMessage selector ]
		ifFalse: [ super doesNotUnderstand: aMessage ].
]

{ #category : #answering }
MAMorphicContainer >> onAnswer: aBlock [
	answerBlock := aBlock
]

{ #category : #morphic }
MAMorphicContainer >> openInHand [
	^ self morph openInHand
]

{ #category : #morphic }
MAMorphicContainer >> openInWindow [

	^ self
		addWindow;
		openInWorld.
]

{ #category : #morphic }
MAMorphicContainer >> openInWorld [
	^ self morph openInWorld
]

{ #category : #actions }
MAMorphicContainer >> save [
	[ self validate ]
		on: MAValidationError
		do: [ :err | ^ self inform: err greaseString ].
	self commit; answer: self model
]

{ #category : #initialization }
MAMorphicContainer >> setChildren: aCollection [
	children := aCollection
]

{ #category : #initialization }
MAMorphicContainer >> setDescription: aDescription [
	super setDescription: aDescription.
	self setChildren: self buildChildren
]

{ #category : #morphic }
MAMorphicContainer >> waitUntilClosed [
	[ self morph world notNil ]
		whileTrue: [ self morph outermostWorldMorph doOneCycle ]
]
