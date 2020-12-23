Class {
	#name : #MAElementBuilder,
	#superclass : #MAVisitor,
	#instVars : [
		'object',
		'element',
		'form',
		'presenter'
	],
	#category : #'Magritte-GToolkit'
}

{ #category : #'as yet unclassified' }
MAElementBuilder class >> buildElementFor: anObject [
	^ self new
		object: anObject;
		visit: anObject magritteDescription
]

{ #category : #generic }
MAElementBuilder >> addButtons [
	self addButtons: #( save cancel )
]

{ #category : #accessing }
MAElementBuilder >> addButtons: aCollection [
	| toolbar |
	toolbar := BrToolbar new
		look: BrToolbarLook new;
		layout:
			(BlGridLayout horizontal
				rowCount: 1;
				cellSpacing: 10);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c grid horizontal alignRight.
			c vertical fitContent ].
	aCollection do: [ :sel |
		| button |
		button := BrButton new
			beSmallSize;
			look: BrGlamorousButtonLabelLook;
			label: sel capitalized;
			action: [ self presenter perform: sel ].
	toolbar addItem: button ].

	self element addChild: toolbar
]

{ #category : #accessing }
MAElementBuilder >> addEditorInputFieldUsing: aDescription [
	| labelElement inputElement text valueString |
	
	valueString := aDescription readToString: self object.
		
	labelElement := BrLabel new text: aDescription label, ':'; look: BrGlamorousLabelLook.
	labelElement constraintsDo: [ :c | 
		c vertical fitContent.
		c horizontal fitContent.
		c grid vertical alignCenter ].
	
	inputElement := BrEditableLabel new.
	inputElement look: BrGlamorousInputFieldSpacingLook.
	inputElement constraintsDo: [ :c | 
		c vertical fitContent.
		c horizontal matchParent.
		c grid vertical alignCenter ].
	text := valueString asRopedText glamorousRegularFont.
	inputElement editor: (BrTextEditor new text: text).
	
	aDescription isRequired ifTrue: [ self error: 'unsupported' ].
	
	aDescription hasComment ifTrue: [ 
		self addTooltip: aDescription comment to: labelElement.
		self addTooltip: aDescription comment to: inputElement ].
	
	self form addChild: labelElement.
	self form addChild: inputElement.
]

{ #category : #accessing }
MAElementBuilder >> addInputFieldUsing: aDescription [
	| labelElement inputElement text valueString |
	
	valueString := aDescription readToString: self memento.
		
	labelElement := BrLabel new text: aDescription label, ':'; look: BrGlamorousLabelLook.
	labelElement constraintsDo: [ :c | 
		c vertical fitContent.
		c horizontal fitContent.
		c grid vertical alignCenter ].
		
	text := valueString asRopedText glamorousRegularFont.
	
	inputElement := BrEditableLabel new
		look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent.
			c grid vertical alignCenter ];
		when: BrEditorAcceptWish do: [ :aWish |
			aDescription writeFromString: aWish text greaseString to: self memento ];
		text: text.
	
	aDescription isRequired ifTrue: [ self error: 'unsupported' ].
	
	aDescription hasComment ifTrue: [ 
		self addTooltip: aDescription comment to: labelElement.
		self addTooltip: aDescription comment to: inputElement ].
	
	self form addChild: labelElement.
	self form addChild: inputElement.
]

{ #category : #accessing }
MAElementBuilder >> addTooltip: aString to: anElement [
	| look |
	self flag: 'Didn''t do `BrGlamorousWithTooltipLook content:` due to bug reported on GT discord feedback channel 12/21/2020'.
	look := BrGlamorousWithTooltipLook new 
		contentStencil: [ 
			BrLabel new
				look: BrGlamorousLabelLook new glamorousRegularFontAndSize;
				padding: (BlInsets all: 2);
				text: aString;
				alignCenter ].
	anElement addLook: look
]

{ #category : #accessing }
MAElementBuilder >> element [
	element ifNotNil: [ ^ element ].
	^ element := BrVerticalPane new
		vFitContent;
		hMatchParent;
		addChild: self form;
		yourself
]

{ #category : #accessing }
MAElementBuilder >> form [
	form ifNotNil: [ ^ form ].
	^ form := BlElement new
		constraintsDo: [ :c |  
			c vertical fitContent.
			c horizontal matchParent ];
		layout: (BlGridLayout horizontal columnCount: 2; cellSpacing: 10);
 		yourself.
]

{ #category : #accessing }
MAElementBuilder >> memento [
	^ self presenter memento
]

{ #category : #accessing }
MAElementBuilder >> object [
	^ object
]

{ #category : #accessing }
MAElementBuilder >> object: anObject [
	object := anObject
]

{ #category : #accessing }
MAElementBuilder >> presenter [
	| memento |
	presenter ifNotNil: [ ^ presenter ].
	"Morphic puts this in container"
	memento := self object mementoClass
		model: self object
		description: self object magritteDescription.
	^ presenter := MABlocContainerPresenter memento: memento
]

{ #category : #accessing }
MAElementBuilder >> visit: anObject [
	self flag: 'if we keep the decorator stuff here, remove this method'.
	super visit: anObject.
	"^ self element"
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitBlockDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitBooleanDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitClassDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitColorDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitContainer: anObject [
	anObject do: [ :each | self visit: each ].
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitDateAndTimeDescription: anObject [
	self visitMagnitudeDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitDateDescription: anObject [
	self visitMagnitudeDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitDescription: anObject [

]

{ #category : #'visiting-description' }
MAElementBuilder >> visitDirectoryDescription: anObject [
	self visitFileDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitDurationDescription: anObject [
	self visitMagnitudeDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitElementDescription: aDescription [
	self addInputFieldUsing: aDescription
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitFileDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitMagnitudeDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitMemoDescription: anObject [
	self visitStringDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitMultipleOptionDescription: anObject [
	self visitOptionDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitNumberDescription: anObject [
	self visitMagnitudeDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitOptionDescription: anObject [
	self visitReferenceDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitPasswordDescription: anObject [
	self visitStringDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitPriorityContainer: anObject [
	self visitContainer: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitReferenceDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitRelationDescription: anObject [
	self visitReferenceDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitSingleOptionDescription: anObject [
	self visitOptionDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitStringDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitSymbolDescription: anObject [
	self visitStringDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitTableDescription: anObject [
	self visitReferenceDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitTimeDescription: anObject [
	self visitMagnitudeDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitToManyRelationDescription: anObject [
	self visitRelationDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitToManyScalarRelationDescription: anObject [
	self visitToManyRelationDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitToOneRelationDescription: anObject [
	self visitRelationDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitTokenDescription: anObject [
	self visitReferenceDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitUrlDescription: anObject [
	self visitElementDescription: anObject
]