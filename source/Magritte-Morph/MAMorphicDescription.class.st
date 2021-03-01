Class {
	#name : #MAMorphicDescription,
	#superclass : #Model,
	#instVars : [
		'memento',
		'description',
		'parent',
		'morph'
	],
	#category : #'Magritte-Morph-Model'
}

{ #category : #'instance creation' }
MAMorphicDescription class >> memento: aMemento [
	^ self memento: aMemento description: aMemento magritteDescription
]

{ #category : #'instance creation' }
MAMorphicDescription class >> memento: aMemento description: aDescription [
	^ self memento: aMemento description: aDescription parent: nil
]

{ #category : #'instance creation' }
MAMorphicDescription class >> memento: aMemento description: aDescription parent: aComponent [
	^ self new
		setMemento: aMemento;
		setDescription: aDescription;
		setParent: aComponent;
		yourself
]

{ #category : #prototypes }
MAMorphicDescription >> barMorph: anArray [
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

{ #category : #private }
MAMorphicDescription >> buildMorph [

	| result |
	result := self rectangleMorph
		setBalloonText: self magritteDescription comment;
		yourself.
	self magritteDescription isReadOnly
		ifTrue: [ self buildMorphViewOn: result ]
		ifFalse: [ self buildMorphEditorOn: result ].
	^ result
]

{ #category : #private }
MAMorphicDescription >> buildMorphEditorOn: aMorph [
	self buildMorphViewOn: aMorph
]

{ #category : #private }
MAMorphicDescription >> buildMorphViewOn: aMorph [
	self subclassResponsibility
]

{ #category : #prototypes }
MAMorphicDescription >> buttonMorph: aSelector [
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

{ #category : #'private-morphic' }
MAMorphicDescription >> buttonState [
	^ true
]

{ #category : #actions }
MAMorphicDescription >> commit [
	self memento commit
]

{ #category : #'accessing-configuration' }
MAMorphicDescription >> defaultBackgroundColor [
	^ self magritteDescription morphColor
]

{ #category : #'accessing-configuration' }
MAMorphicDescription >> defaultSpacerSize [
	^ 5
]

{ #category : #accessing }
MAMorphicDescription >> magritteDescription [
	^ description
]

{ #category : #accessing }
MAMorphicDescription >> memento [
	^ memento
]

{ #category : #'accessing-dynamic' }
MAMorphicDescription >> model [
	^ self memento model
]

{ #category : #accessing }
MAMorphicDescription >> morph [
	^ morph ifNil: [ morph := self buildMorph ]
]

{ #category : #accessing }
MAMorphicDescription >> parent [
	^ parent
]

{ #category : #prototypes }
MAMorphicDescription >> rectangleMorph [
	^ BorderedMorph new
		borderWidth: 0;
		color: Color transparent;
		layoutPolicy: TableLayout new;
		cellPositioning: #topLeft;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		yourself
]

{ #category : #actions }
MAMorphicDescription >> reset [
	self memento reset
]

{ #category : #'accessing-dynamic' }
MAMorphicDescription >> root [
	^ self parent isNil
		ifTrue: [ self ]
		ifFalse: [ self parent root ]
]

{ #category : #initialization }
MAMorphicDescription >> setDescription: aDescription [
	description := aDescription
]

{ #category : #initialization }
MAMorphicDescription >> setMemento: aMemento [
	memento := aMemento
]

{ #category : #initialization }
MAMorphicDescription >> setParent: aMorph [
	parent := aMorph
]

{ #category : #prototypes }
MAMorphicDescription >> stringMorph [
	^ StringMorph new
]

{ #category : #actions }
MAMorphicDescription >> validate [
	"Flushes the cached state of some morphic elements (such as text-morphs) to the memento and then does the validation. I don't know of a better flush the morphic contents (happy flickering), probably morphic is just too limited to customize that easily or I am too dumb to find out."

	self morph allMorphsDo: [ :each |
		(each respondsTo: #accept)
			ifTrue: [ each accept ] ].
	self memento validate
]

{ #category : #prototypes }
MAMorphicDescription >> windowMorph [
	^ SystemWindow labelled: self magritteDescription label
]
