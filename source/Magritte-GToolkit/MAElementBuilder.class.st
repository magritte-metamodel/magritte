"
I create a Bloc element representing a Magritte form. By default, I use my model ${method:MAElementBuilder>>#object}$'s Magritte Description, but you can pass any to ${method:MAElementBuilder>>#visit:}$.
!Implementation Note
Unlike the Morphic implementation, which has a presenter class per description type, I take advantage of Magritte's built-in visitor capabilities. This allowed us to avoid about 18 classes, many of which had only a few methods. We will see if this approach holds up as the implementation is fleshed out and used in the real world. We ''did'' implement ${class:MABlocContainerPresenter}$ because it represents the model object and:
- provides a nice point for inspection/debugging. To access from my built element: ==anElement userData at: #magrittePresenter==
- serves as the reciever for form actions like ${method:MABlocContainerPresenter>>#save|label='save'}$.
"
Class {
	#name : #MAElementBuilder,
	#superclass : #MAVisitor,
	#instVars : [
		'object',
		'element',
		'form',
		'presenter',
		'buttonSelectors',
		'objectDescription',
		'completionControllerClass',
		'completionStrategy'
	],
	#category : #'Magritte-GToolkit'
}

{ #category : #examples }
MAElementBuilder class >> example [
	<gtExample>
	^ self new
		object: MAContainer samplePersonHarryPotter;
		objectDescription: MAContainer samplePersonDescription;
		element
]

{ #category : #'instance creation' }
MAElementBuilder class >> on: anObject [
	^ self new
		object: anObject;
		yourself
]

{ #category : #generic }
MAElementBuilder >> addButtons [
	self addButtons: #( save force cancel )
]

{ #category : #accessing }
MAElementBuilder >> addButtons: aCollection [
	"#addButtons: is part of the existing Morphic/Seaside API"
	self flag: 'The comment said "We store the selectors instead of constructing the buttons to defer all element creation to first element access", but does that really make sense because the form and toolbar are created on visit?'.
	self buttonSelectors: aCollection
]

{ #category : #private }
MAElementBuilder >> addInputFieldUsing: aDescription [

	self 
		using: aDescription
		addInputField: [ :headerElement |
			(self newInputElementUsing: aDescription)
				header: headerElement;
				yourself ]
]

{ #category : #accessing }
MAElementBuilder >> addTooltip: aString to: anElement [
	| look |
	self
		flag:
			'Didn''t do `BrGlamorousWithTooltipLook content:` due to bug reported on GT discord feedback channel 12/21/2020'.
	look := BrGlamorousWithTooltipAptitude new
		contentStencil: [ BrLabel new
				aptitude: BrGlamorousLabelAptitude new glamorousRegularFontAndSize;
				padding: (BlInsets all: 2);
				text: aString;
				alignCenter ].
	anElement addAptitude: look
]

{ #category : #accessing }
MAElementBuilder >> buttonSelectors [
	^ buttonSelectors ifNil: #()
]

{ #category : #accessing }
MAElementBuilder >> buttonSelectors: aCollection [
	buttonSelectors := aCollection
]

{ #category : #private }
MAElementBuilder >> calendarButtonFor: editor [
	"Adapted from GtSpotterDropdownButtonStencil>>#create"

	| dropdownAptitude |
	dropdownAptitude := BrGlamorousWithDropdownAptitude
		handle: [ 
			BrButton new
				icon: BrGlamorousVectorIcons note;
				aptitude: BrGlamorousButtonWithIconAptitude - BrGlamorousButtonWithLabelTooltipAptitude
						- BrGlamorousButtonExteriorAptitude ]
		content: [ | calendar date |
			date := [ editor text asString asDate ] on: Error do: [ Date today ].
			calendar := GtCalendarElement forDate: date.
			calendar
				when: GtCalendarDateClickedEvent
				do: [  "calendar date: event date. Redundant because a new calendar will be created on next button click":event | 
					editor
						beEditable;
						text: event date mmddyyyy asRopedText.
					calendar fireEvent: BrDropdownHideWish new ] ].

	^ BrButton new
		icon: BrGlamorousVectorIcons note;
		label: 'Pick from calendar';
		aptitude: BrGlamorousButtonWithIconAptitude;
		addAptitude: dropdownAptitude;
		yourself
]

{ #category : #private }
MAElementBuilder >> checkIcon [
	^ BrGlamorousVectorIcons accept create
		background: Color green;
		yourself
]

{ #category : #accessing }
MAElementBuilder >> completionControllerClass [

	^ completionControllerClass ifNil: [ PeGtCompletionController ]
]

{ #category : #accessing }
MAElementBuilder >> completionControllerClass: anObject [

	completionControllerClass := anObject
]

{ #category : #accessing }
MAElementBuilder >> completionStrategy [

	^ completionStrategy 
		ifNil: [ GtStringsCompletionStrategy new ]
		ifNotNil: [ completionStrategy value ].
]

{ #category : #accessing }
MAElementBuilder >> completionStrategy: aValuable [

	completionStrategy := aValuable
]

{ #category : #accessing }
MAElementBuilder >> element [
	| hasVisited |
	element ifNotNil: [ ^ element ].
	hasVisited := form isNotNil.
	hasVisited ifFalse: [ self visit: self objectDescription ].
	element := BrVerticalPane new
		vFitContent;
		hMatchParent;
		addChild: self form;
		yourself.
	element userData at: #magrittePresenter put: self presenter.
	self hasButtons ifTrue: [ element addChild: self toolbar ].
	^ element
]

{ #category : #accessing }
MAElementBuilder >> form [
	| headerStancil |
	form ifNotNil: [ ^ form ].
	headerStancil := [ :string | 
		BrLabel new 
			text: string asRopedText bold;
			aptitude: BrGlamorousLabelAptitude;
			yourself ].
	^ form := "BlElement"BrVerticalPane new
		constraintsDo: [ :c |  
			c vertical fitContent.
			c horizontal matchParent ]";
		layout: (BlGridLayout horizontal columnCount: 2; cellSpacing: 10)"";
		addChild: (headerStancil value: 'Field');
		addChild: (headerStancil value: 'Current');"
		"addChild: (headerStancil value: 'Original');"
 	yourself.
]

{ #category : #testing }
MAElementBuilder >> hasButtons [
	^ self buttonSelectors isNotEmpty
]

{ #category : #accessing }
MAElementBuilder >> memento [
	^ self presenter memento
]

{ #category : #accessing }
MAElementBuilder >> newInputElementUsing: aDescription [

	^ MABrTextEditor 
		onDescription: aDescription
		forBuilder: self
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
MAElementBuilder >> objectDescription [
	^ objectDescription ifNil: [ objectDescription := self object magritteDescription ]
]

{ #category : #accessing }
MAElementBuilder >> objectDescription: aDescription [
	objectDescription := aDescription
]

{ #category : #accessing }
MAElementBuilder >> presenter [
	| memento |
	presenter ifNotNil: [ ^ presenter ].
	"Morphic puts this in container"
	memento := self object mementoClass
		model: self object
		description: self objectDescription.
	^ presenter := MABlocContainerPresenter memento: memento
]

{ #category : #accessing }
MAElementBuilder >> showValidationPassFor: headerElement [

	headerElement
		childNamed: #icon 
		ifFound: [ :oldIcon | 
			headerElement
				replaceChild: oldIcon
				with: self checkIcon
				as: #icon ]
		ifNone: [ headerElement addChild: self checkIcon as: #icon ]
]

{ #category : #accessing }
MAElementBuilder >> showWarningFor: headerElement [

	headerElement
		childNamed: #icon 
		ifFound: [ :oldIcon | 
			headerElement
				replaceChild: oldIcon
				with: self warningIcon
				as: #icon ]
		ifNone: [ headerElement addChild: self warningIcon as: #icon ]
]

{ #category : #accessing }
MAElementBuilder >> textUsing: aDescription [
	| valueString |
	valueString := aDescription readToString: self memento.
	^ valueString asRopedText glamorousRegularFont
]

{ #category : #accessing }
MAElementBuilder >> toolbar [
	| toolbar |
	toolbar := BrToolbar new
		aptitude: BrToolbarAptitude new;
		layout:
			(BlGridLayout horizontal
				rowCount: 1;
				cellSpacing: 10);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c grid horizontal alignRight.
			c vertical fitContent ].
	self buttonSelectors
		do: [ :sel | 
			| button |
			button := BrButton new
				beSmallSize;
				aptitude: BrGlamorousButtonWithLabelAptitude;
				label: sel capitalized;
				action: [ self presenter perform: sel ].
			toolbar addItem: button ].
	^ toolbar
]

{ #category : #private }
MAElementBuilder >> using: aDescription addInputField: aValuable [
	| labelElement "diffElement" inputElement labelString headerElement |
	aDescription isVisible ifFalse: [ ^ self ].

	labelString := aDescription label.
	aDescription isRequired ifTrue: [ labelString := labelString , ' *' ].

	labelElement := BrLabel new
		text: labelString asRopedText bold;
		addEventHandlerOn: BlClickEvent
			do: [ :evt | evt target phlow spawnObject: (aDescription read: self object) ];
		aptitude: BrGlamorousLabelAptitude.
			
	headerElement := BrHorizontalPane new
		fitContent;
		margin: (BlInsets all: 3);
		addChild: labelElement;
		yourself.

	inputElement := (aValuable cull: headerElement)
		margin: (BlInsets top: 2 bottom: 10);
		yourself.

	labelElement
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent.
			c grid vertical alignCenter.
			c grid horizontal alignRight ].

	aDescription hasComment
		ifTrue: [ self addTooltip: aDescription comment to: headerElement.
			self addTooltip: aDescription comment to: inputElement ].	"diffElement := BrEditor new
		text: inputElement text copy; ""if we don't copy, diff magically changes as input updates"	"aptitude: BrGlamorousEditorAptitude"

	self form addChild: headerElement.
	self form addChild: inputElement	"self form addChild: diffElement."
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
MAElementBuilder >> visitBooleanDescription: aDescription [

	self 
		using: aDescription
		addInputField: [ 
			BrCheckbox new 
				aptitude: BrGlamorousCheckboxAptitude;
				checked: (aDescription read: self memento);
				whenCheckedDo: [ aDescription write: true to: self memento ];
				whenUncheckedDo: [ aDescription write: false to: self memento ] ]
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
MAElementBuilder >> visitDateDescription: aDescription [

	self 
		using: aDescription 
		addInputField: [ :headerElement |
			| editor calendarButton |
			editor := (self newInputElementUsing: aDescription)
				header: headerElement;
				yourself.
			editor constraintsDo: [ :c |
				c minWidth: 100 ].
			calendarButton := self calendarButtonFor: editor.
			BrHorizontalPane new
					fitContent;
					cellSpacing: 5;
					addChild: editor;
					addChild: calendarButton;
					yourself ]
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
MAElementBuilder >> visitMemoDescription: aDescription [
	| lineHeight |
	self flag: 'Lots of duplication from standard inputElement creation; line height very rough based on 14 pt size - waiting on answer on Discord'.
	lineHeight := 14 * 1.5.
	
	self 
		using: aDescription
		addInputField: [ 
			| inputElement |
			inputElement := BrEditor new
				beEditable;
				text: (self textUsing: aDescription);
				aptitude: BrGlamorousEditorAptitude new glamorousRegularFontAndSize;
				vMatchParent;
				hMatchParent.
				
			inputElement editor when: BrTextEditorModifiedEvent
					do: [ :event | aDescription writeFromString: event text greaseString to: self memento ].
					
			BlElement new
				aptitude: BrGlamorousWithVerticalResizerAptitude;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical exact: lineHeight * aDescription lineCount ];
				addChild: inputElement;
				yourself ]
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

{ #category : #private }
MAElementBuilder >> visitRelationDescription: aDescription withTokenElementClass: aClass [

	aDescription gtSearchSource ifNil: [ ^ self visitRelationDescription: aDescription ].
	
	self 
		using: aDescription
		addInputField: [ 
			aClass 
				forObject: self memento 
				withRelationDescription: aDescription ]
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitSingleOptionDescription: aDescription [

	self 
		using: aDescription
		addInputField: [ 
			MADropdownElement new 
				items: aDescription allOptions;
				itemDescription: aDescription reference;
				selection: (self memento readUsing: aDescription);
				when: MADropdownWish do: [ :aWish | 
					aDescription write: aWish selection to: self memento ];
				yourself ]
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
MAElementBuilder >> visitToManyRelationDescription: aDescription [
	^ self 
		visitRelationDescription: aDescription 
		withTokenElementClass: MATokenCollectorElement
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitToManyScalarRelationDescription: anObject [
	self visitToManyRelationDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitToOneRelationDescription: aDescription [
	^ self 
		visitRelationDescription: aDescription 
		withTokenElementClass: MATokenSelectorElement
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitTokenDescription: anObject [
	self visitReferenceDescription: anObject
]

{ #category : #'visiting-description' }
MAElementBuilder >> visitUrlDescription: anObject [
	self visitElementDescription: anObject
]

{ #category : #accessing }
MAElementBuilder >> warningIcon [

	^ BlElement new
		geometry: BlTriangleGeometry new beTop;
		size: 8@8;
		background: Color orange;
		yourself.
]
