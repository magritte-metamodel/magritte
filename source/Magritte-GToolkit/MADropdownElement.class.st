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
	^ self basicNew
		items: (Smalltalk allClasses first: 5);
		initialize.
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
MADropdownElement >> initialize [
	super initialize.
	self initializeToggleButton: self.
	self
		addLook: (BrGlamorousWithDropdownLook
				handle: [ 
				| handle |
				handle := BrButton new.
				self initializeToggleButton: handle.
				handle
					label: (self selection ifNotNil: [ :sel | sel asString ] ifNil: '');
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
MADropdownElement >> items: anObject [
	items := anObject
]

{ #category : #accessing }
MADropdownElement >> popupList [
	"Adapted from BrDropdownExamples>>#popupList"
	"listElement ifNotNil: [ ^ listElement ]."
	^ BrSimpleList new
		lookDo: [ :aLook | aLook listElement constraintsDo: [ :c | c maxHeight: 200 ] ];
		layout: BlLinearLayout vertical;
		padding: (BlInsets all: 5);
		vFitContent;
		hExact: 200;
		itemStencil: [
			BrLabel new
				"hMatchParent;"
				look: BrGlamorousLabelLook new + (BrStyleCommonLook new
					selected: [ :aStyle | aStyle background: Color veryVeryLightGray ]);
				padding: (BlInsets all: 5);
				addEventHandlerOn: BlClickEvent
							do: [ :a :b | Halt now ];
				yourself ];
		itemDataBinder: [ :eachElement :eachItem :eachIndex | eachElement text: eachItem asString ];
		items: self items;
		yourself.
]

{ #category : #accessing }
MADropdownElement >> selection [
	^ selection
]

{ #category : #accessing }
MADropdownElement >> selection: anObject [
	selection := anObject.
	self label: (self selection ifNotNil: [ :sel | sel asString ] ifNil: '').
]
