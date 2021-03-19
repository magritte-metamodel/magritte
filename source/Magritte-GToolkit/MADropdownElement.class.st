Class {
	#name : #MADropdownElement,
	#superclass : #BrButton,
	#instVars : [
		'items',
		'selection'
	],
	#category : #'Magritte-GToolkit'
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
		addLook:
			(BrGlamorousWithDropdownLook
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
		look: BrGlamorousButtonWithLabelAndIconLook;
		yourself
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
		lookDo:
				[ :aLook | aLook listElement constraintsDo: [ :c | c maxHeight: 200 ] ];
		layout: BlLinearLayout vertical;
		padding: (BlInsets all: 5);
		vFitContent;
		hExact: 200;
		itemStencil: [ 
			BrLabel new
				look: BrGlamorousLabelLook new +
					(BrStyleCommonLook new selected: [ :aStyle | aStyle background: Color veryVeryLightGray ]);
				padding: (BlInsets all: 5);
				"hMatchParent;"
				addEventHandlerOn: BlClickEvent
					do: [ :evt | self handleSelection: evt target ];
				yourself ];
		itemDataBinder: [ :eachElement :eachItem :eachIndex | 
			eachElement userData at: #item put: eachItem.
			eachElement text: eachItem displayString ];
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
	self flag: 'Morphic Dropdown does: `self magritteDescription reference toString: e`. Not sure what the ramifications are, but I don''t thing that uses displayString, which we need for undefinedValue/NullPattern - spd'.
	^ self selection ifNotNil: [ :sel | sel displayString ] ifNil: ''
]
