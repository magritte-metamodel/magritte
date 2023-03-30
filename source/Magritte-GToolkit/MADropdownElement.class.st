Class {
	#name : #MADropdownElement,
	#superclass : #BrButton,
	#instVars : [
		'items',
		'selection',
		'itemDescription'
	],
	#category : #'Magritte-GToolkit-Widgets'
}

{ #category : #accessing }
MADropdownElement class >> example [
	<gtExample>
	^ self new
		items: (Smalltalk allClasses first: 5);
		yourself.
]

{ #category : #accessing }
MADropdownElement class >> exampleSelection [
	<gtExample>
	| result |
	result := self example.
	result selection: result items first.
	^ result
]

{ #category : #accessing }
MADropdownElement >> handleSelection: anElement [
	| selItem |
	"Must check self and parent(s) because target can be label or its text"
	selItem := anElement
		withAllParentsDetect: [ :e | e userData includesKey: #item ]
		ifFound: [ :e | e userData at: #item ]
		ifNone: [ nil ].
	self selection: selItem.
	anElement fireEvent: BrDropdownHideWish new
]

{ #category : #accessing }
MADropdownElement >> initialize [
	super initialize.
	self initializeToggleButton: self.
	self
		addAptitude:
			(BrGlamorousWithDropdownAptitude
				handle: [ | handle |
					handle := BrButton new.
					self initializeToggleButton: handle.
					handle
						label: self selectionString;
						yourself ]
				content: [ self popupList ]);
		yourself
]

{ #category : #accessing }
MADropdownElement >> initializeToggleButton: aButton [
	^ aButton
		label: '';
		icon:
			(BlElement new
				size: 8 @ 8;
				geometry:
					(BlPolygon
						vertices:
							{(0 @ 0).
							(8 @ 0).
							((8 / 2) rounded @ 8)});
				background: Color lightGray;
				margin: (BlInsets left: 6);
				constraintsDo: [ :c | c linear vertical alignCenter ]);
		aptitude: BrGlamorousButtonWithLabelAndIconAptitude;
		yourself
]

{ #category : #accessing }
MADropdownElement >> itemDescription [
	^ itemDescription
]

{ #category : #accessing }
MADropdownElement >> itemDescription: anObject [
	itemDescription := anObject
]

{ #category : #accessing }
MADropdownElement >> items [
	^ items ifNil: [ items := OrderedCollection new ]
]

{ #category : #accessing }
MADropdownElement >> items: aCollection [
	items := aCollection
]

{ #category : #accessing }
MADropdownElement >> popupList [
	"Adapted from BrDropdownExamples>>#popupList"

	"listElement ifNotNil: [ ^ listElement ]."

	| list |
	list := BrSimpleList new.
	^ list
		aptitudeDo:
				[ :aLook | aLook listElement constraintsDo: [ :c | c maxHeight: 200 ] ];
		layout: BlLinearLayout vertical;
		padding: (BlInsets all: 5);
		vFitContent;
		hExact: 200;
		itemStencil: [ BrLabel new
				aptitude:
					BrGlamorousLabelAptitude new
						+
							(BrStyleCommonAptitude new
								selected: [ :aStyle | aStyle background: Color veryVeryLightGray ]);
				padding: (BlInsets all: 5);
				"hMatchParent;"
				addEventHandlerOn: BlClickEvent
					do: [ :evt | self handleSelection: evt target ];
				yourself ];
		itemDataBinder: [ :eachElement :eachItem :eachIndex | 
			| displayString |
			eachElement userData at: #item put: eachItem.
			displayString := self itemDescription toString: eachItem.
			eachElement text: displayString ];
		items: self items;
		yourself
]

{ #category : #accessing }
MADropdownElement >> selection [
	^ selection
]

{ #category : #accessing }
MADropdownElement >> selection: anObject [
	selection := anObject.
	self label: self selectionString.
	self dispatchEvent: (MADropdownWish new selection: self selection)
]

{ #category : #accessing }
MADropdownElement >> selectionString [
	^ self selection 
		ifNil: [ '' ]
		ifNotNil: [ :sel | sel gtDisplayText ]
]

{ #category : #accessing }
MADropdownElement >> text [
	"This is to show the initial value in the container UI"
	^ self selectionString
]
