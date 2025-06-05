Class {
	#name : 'MADescriptionPresenter',
	#superclass : 'Model',
	#traits : 'MATDescriptionPresenter',
	#classTraits : 'MATDescriptionPresenter classTrait',
	#instVars : [
		'view'
	],
	#category : 'Magritte-UI'
}

{ #category : 'instance creation' }
MADescriptionPresenter class >> memento: aMemento [
	^ self memento: aMemento description: aMemento magritteDescription
]

{ #category : 'instance creation' }
MADescriptionPresenter class >> memento: aMemento description: aDescription [
	^ self memento: aMemento description: aDescription parent: nil
]

{ #category : 'instance creation' }
MADescriptionPresenter class >> memento: aMemento description: aDescription parent: aComponent [
	^ self new
		setMemento: aMemento;
		setDescription: aDescription;
		setParent: aComponent;
		yourself
]

{ #category : 'prototypes' }
MADescriptionPresenter >> barMorph: anArray [
	| bar |
	bar := self rectangleMorph
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		listDirection: #leftToRight;
		listCentering: #center;
		wrapCentering: #bottomRight;
		cellInset: self defaultSpacerSize;
		yourself.
	anArray do: [ :selector |
		bar addMorphBack: (self buttonMorph: selector) ].
	^ bar
]

{ #category : 'private' }
MADescriptionPresenter >> buildMorph [

	| result |
	result := self rectangleMorph
		setBalloonText: self magritteDescription comment;
		yourself.
	self magritteDescription isReadOnly
		ifTrue: [ self buildMorphViewOn: result ]
		ifFalse: [ self buildMorphEditorOn: result ].
	^ result
]

{ #category : 'private' }
MADescriptionPresenter >> buildMorphEditorOn: aMorph [
	self buildMorphViewOn: aMorph
]

{ #category : 'private' }
MADescriptionPresenter >> buildMorphViewOn: aMorph [
	self subclassResponsibility
]

{ #category : 'prototypes' }
MADescriptionPresenter >> buttonMorph: aSelector [
	| button |
	button := PluggableButtonMorph
		on: self
		getState: #buttonState
		action: aSelector.
	button
		label: aSelector;
		hResizing: #spaceFill;
		shortcutCharacter: aSelector first.
	^ button
]

{ #category : 'private-morphic' }
MADescriptionPresenter >> buttonState [
	^ true
]

{ #category : 'accessing-configuration' }
MADescriptionPresenter >> defaultBackgroundColor [
	^ self magritteDescription morphColor
]

{ #category : 'accessing-configuration' }
MADescriptionPresenter >> defaultSpacerSize [
	^ 5
]

{ #category : 'accessing' }
MADescriptionPresenter >> morph [
	^ view ifNil: [ view := self buildMorph ]
]

{ #category : 'prototypes' }
MADescriptionPresenter >> rectangleMorph [
	^ BorderedMorph new
		borderWidth: 0;
		color: Color transparent;
		layoutPolicy: TableLayout new;
		cellPositioning: #topLeft;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		yourself
]

{ #category : 'prototypes' }
MADescriptionPresenter >> stringMorph [
	^ StringMorph new
]

{ #category : 'prototypes' }
MADescriptionPresenter >> windowMorph [
	^ SystemWindow labelled: self magritteDescription label
]
