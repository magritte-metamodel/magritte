"
A WindowModel is a spec model for a Window
"
Class {
	#name : #WindowModel,
	#superclass : #AbstractBasicWidget,
	#instVars : [
		'model',
		'initialExtent',
		'title',
		'isClosedHolder'
	],
	#category : 'Spec-Widgets'
}

{ #category : #specs }
WindowModel class >> defaultSpec [
	<spec>
	
	^ #( WindowSpec model: model )
]

{ #category : #private }
WindowModel >> addModelIn: widget withSpec: aSpec [

	self model ifNil: [ ^ self ].
	
	widget
		addMorph: (self model buildWithSpec: aSpec)
		frame: (0@0 corner: 1@1)
]

{ #category : #private }
WindowModel >> addModelIn: widget withSpecLayout: aSpec [

	self model ifNil: [ ^ self ].
	widget
		addMorph: (self model buildWithSpecLayout: aSpec)
		frame: (0@0 corner: 1@1)
]

{ #category : #private }
WindowModel >> buildWithSpec: aSpec [
	"Build the widget using the spec name provided as argument"
	| widget |
	
	(self spec notNil and: [ self needRebuild not ])
		ifTrue: [ widget := self spec instance ]
		ifFalse: [ 
			widget := SpecInterpreter private_buildWidgetFor: self withSpec: self defaultSpecSelector.
			self addModelIn: widget withSpec: aSpec ].

	self extent ifNotNil: [:ex | 
		(widget respondsTo: #extent:)
			ifTrue: [ widget extent: ex ]].
		
	^ widget
]

{ #category : #private }
WindowModel >> buildWithSpecLayout: aSpec [
	"Build the widget using the spec name provided as argument"
	| widget |
	
	(self spec notNil and: [ self needRebuild not ])
		ifTrue: [ widget := self spec instance ]
		ifFalse: [
			widget := SpecInterpreter private_buildWidgetFor: self withSpec: self defaultSpecSelector.
			self addModelIn: widget withSpecLayout: aSpec ].

	self extent ifNotNil: [:ex | 
		(widget respondsTo: #extent:)
			ifTrue: [ widget extent: ex ]].
		
	^ widget
]

{ #category : #protocol }
WindowModel >> close [
	self widget ifNotNil: [ :w| w close ].
]

{ #category : #private }
WindowModel >> defaultInitialExtent [
	
	^ 400@300
]

{ #category : #focus }
WindowModel >> giveFocusToNextFrom: aModel [ 

	^ self model giveFocusToNextFrom: aModel
]

{ #category : #focus }
WindowModel >> giveFocusToPreviousFrom: aModel [ 

	^ self model giveFocusToPreviousFrom: aModel 
]

{ #category : #morphic }
WindowModel >> initialExtent [

	^ initialExtent contents
		ifNil: [ self model 
				ifNil: [ self defaultInitialExtent ]
				ifNotNil: [:m | m initialExtent
								ifNil: [ self defaultInitialExtent ]]]
]

{ #category : #initialize }
WindowModel >> initialize [
	"Initialization code for WindowModel"

	super initialize.

	model := nil asValueHolder.
	initialExtent := nil asValueHolder.
	title := self class title asValueHolder.
	isClosedHolder := false asValueHolder.
	
	model whenChangedDo: [:m | self updateTitle ].
]

{ #category : #protocol }
WindowModel >> isDisplayed [

	^ self window
		ifNil: [ false ]
		ifNotNil: [:w | w isDisplayed ]
]

{ #category : #morphic }
WindowModel >> model [
	
	^ model contents
]

{ #category : #protocol }
WindowModel >> model: aModel [

	model contents: aModel
]

{ #category : #protocol }
WindowModel >> openModal: aWindow [ 

	self widget ifNotNil: [:w | w openModal: aWindow ]
]

{ #category : #private }
WindowModel >> openWithSpec: aSpec [

	window := self buildWithSpec: aSpec.
	window openInWorld.
	window title: self title
]

{ #category : #private }
WindowModel >> openWithSpecLayout: aSpec [

	window := self buildWithSpecLayout: aSpec.
	window openInWorld.
	window title: self title
]

{ #category : #private }
WindowModel >> rebuildWithSpec: aSpec [
	| sub |
	
	sub := window submorphs copy.
	window removeAllMorphs.
	sub allButLast do: [:e | window addMorphBack: e ].
	self addModelIn: self widget withSpec: aSpec
]

{ #category : #private }
WindowModel >> rebuildWithSpecLayout: aSpec [
	| sub |
	
	sub := window submorphs copy.
	window removeAllMorphs.
	sub allButLast do: [:e | window addMorphBack: e ].
	self addModelIn: self widget withSpecLayout: aSpec
]

{ #category : #private }
WindowModel >> title [

	^ self model
		ifNil: [ super title ]
		ifNotNil: [:m | m title ]
]

{ #category : #private }
WindowModel >> title: aString [

	^ self widget
		ifNotNil: [:w | w title: aString ]
]

{ #category : #private }
WindowModel >> updateTitle [
	"Update the window title"

	self window
		ifNotNil: [:w | w title: self title ]
]

{ #category : #'protocol-events' }
WindowModel >> whenClosedDo: aBlock [

	isClosedHolder whenChangedDo: [:bool | bool ifTrue: aBlock ]
]

{ #category : #morphic }
WindowModel >> windowIsClosing [

	isClosedHolder contents: true
]
