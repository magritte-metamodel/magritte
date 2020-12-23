Class {
	#name : #MABlocContainerPresenter,
	#superclass : #MADescriptionPresenter,
	#traits : 'MATContainerPresenter',
	#classTraits : 'MATContainerPresenter classTrait',
	#category : #'Magritte-UI'
}

{ #category : #decorating }
MABlocContainerPresenter >> addButtons: anArray [
	view := self rectangleMorph
		addMorphBack: self morph;
		addMorphBack: (self barMorph: anArray);
		yourself
]

{ #category : #decorating }
MABlocContainerPresenter >> addWindow [
	| scrollPane newMorph |
	scrollPane := GeneralScrollPane new.
	newMorph := self morph 
		vResizing: #spaceFill;
		hResizing: #spaceFill.
	scrollPane changeScrollerTableLayout; scrollTarget: newMorph.	


	view := self windowMorph
		model: self;
		vResizing: #shrinkWrap;
		addMorph: (scrollPane layoutInset: 5 @ 5)
			frame: (0 @ 0 corner: 1 @ 1);
		yourself
]

{ #category : #private }
MABlocContainerPresenter >> buildChildren [
	self flag: 'very similar in Seaside, except children kept in a dictionary, not a sequencable collection. Why?'.
	^ Array streamContents: [ :stream |
		self magritteDescription do: [ :each |
			each isVisible ifTrue: [
				stream nextPut: (each morphicClass
					memento: self memento
					description: each
					parent: self) ] ] ]
]

{ #category : #private }
MABlocContainerPresenter >> buildMorphViewOn: aMorph [

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
MABlocContainerPresenter >> callInHand [
	| result |
	result := nil.
	self onAnswer: [ :value | result := value ].
	self openInHand; waitUntilClosed.
	^ result
]

{ #category : #morphic }
MABlocContainerPresenter >> callInWorld [
	| result |
	result := nil.
	self onAnswer: [ :value | result := value ].
	self openInWorld; waitUntilClosed.
	^ result
]

{ #category : #'error handling' }
MABlocContainerPresenter >> doesNotUnderstand: aMessage [
	"Forward callbacks from #addButtons: to the model if appropriate"

	(self model respondsTo: aMessage selector)
		ifTrue: [ self model perform: aMessage selector ]
		ifFalse: [ super doesNotUnderstand: aMessage ].
]

{ #category : #answering }
MABlocContainerPresenter >> onAnswer: aBlock [
	answerBlock := aBlock
]

{ #category : #'as yet unclassified' }
MABlocContainerPresenter >> onCancel [
	self reset.
	self flag: 'that resets the memento, but we need to reset the form values'
]

{ #category : #morphic }
MABlocContainerPresenter >> openInHand [
	^ self morph openInHand
]

{ #category : #morphic }
MABlocContainerPresenter >> openInWindow [

	^ self
		addWindow;
		openInWorld.
]

{ #category : #morphic }
MABlocContainerPresenter >> openInWorld [
	^ self morph openInWorld
]

{ #category : #morphic }
MABlocContainerPresenter >> waitUntilClosed [
	[ self morph world notNil ]
		whileTrue: [ self morph outermostWorldMorph doOneCycle ]
]
