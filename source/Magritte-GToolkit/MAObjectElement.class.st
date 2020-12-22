"
I will not last. I am just a POC and a place to collect relevant code from around GT.
"
Class {
	#name : #MAObjectElement,
	#superclass : #BrVerticalPane,
	#instVars : [
		'form'
	],
	#category : #'Magritte-GToolkit-Bloc'
}

{ #category : #accessing }
MAObjectElement >> form [
	form := BlElement new.
	form constraintsDo: [ :c |  
		c vertical fitContent.
		c horizontal matchParent ].
	form layout: (BlGridLayout horizontal columnCount: 2; cellSpacing: 10).
	^ form
]

{ #category : #accessing }
MAObjectElement >> initialize [
	super initialize.
	self 
		vFitContent;
		hMatchParent.
		
	self
		addChild: self form;
		addChild: self toolbar
]

{ #category : #accessing }
MAObjectElement >> inputElementNamed: aString in: formElement [
	| labelElement inputElement text |
	labelElement := BrLabel new text: aString, ':'; look: BrGlamorousLabelLook.
	labelElement constraintsDo: [ :c | 
		c vertical fitContent.
		c horizontal fitContent.
		c grid vertical alignCenter ].
	inputElement := BrEditorElement new.
	inputElement look: BrGlamorousInputFieldSpacingLook.
	inputElement constraintsDo: [ :c | 
		c vertical fitContent.
		c horizontal matchParent.
		c grid vertical alignCenter ].
	text := '' asRopedText glamorousRegularFont.
	inputElement editor: (BrTextEditor new text: text).
	formElement addChild: labelElement.
	formElement addChild: inputElement.
	^ inputElement
]

{ #category : #accessing }
MAObjectElement >> inputElementNamed: aString value: valueString [
	| labelElement inputElement text |
	labelElement := BrLabel new text: aString, ':'; look: BrGlamorousLabelLook.
	labelElement constraintsDo: [ :c | 
		c vertical fitContent.
		c horizontal fitContent.
		c grid vertical alignCenter ].
	inputElement := BrEditorElement new.
	inputElement look: BrGlamorousInputFieldSpacingLook.
	inputElement constraintsDo: [ :c | 
		c vertical fitContent.
		c horizontal matchParent.
		c grid vertical alignCenter ].
	text := valueString asRopedText glamorousRegularFont.
	inputElement editor: (BrTextEditor new text: text).
	form addChild: labelElement.
	form addChild: inputElement.
	^ inputElement
]

{ #category : #accessing }
MAObjectElement >> toolbar [
	| toolbar saveButton |
	toolbar := BrToolbar new
		look: BrToolbarLook new;
		layout: (BlGridLayout horizontal rowCount: 1; cellSpacing: 10);
		constraintsDo: [ :c |
			c horizontal fitContent.
			c grid horizontal alignRight.
			c vertical fitContent ].
	saveButton := BrButton new
		beSmallSize;
		look: BrGlamorousButtonLabelLook;
		label: 'Save';
		action: [ self save ].
	toolbar addItem:  saveButton.
	^ toolbar
]
