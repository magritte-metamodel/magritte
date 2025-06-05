Class {
	#name : 'MABrTextEditor',
	#superclass : 'BrEditor',
	#instVars : [
		'elementDescription',
		'builder',
		'errors',
		'header'
	],
	#category : 'Magritte-GToolkit'
}

{ #category : 'accessing' }
MABrTextEditor class >> elementDescription: anMAElementDescription [

	^ self basicNew
		elementDescription: anMAElementDescription;
		initialize
]

{ #category : 'accessing' }
MABrTextEditor class >> onDescription: anMAElementDescription forBuilder: anMAElementBuilder [

	^ self basicNew
		elementDescription: anMAElementDescription;
		builder: anMAElementBuilder;
		initialize
]

{ #category : 'accessing' }
MABrTextEditor >> builder [
	^ builder
]

{ #category : 'accessing' }
MABrTextEditor >> builder: anObject [
	builder := anObject
]

{ #category : 'accessing' }
MABrTextEditor >> elementDescription [
	^ elementDescription
]

{ #category : 'accessing' }
MABrTextEditor >> elementDescription: anObject [
	elementDescription := anObject
]

{ #category : 'accessing' }
MABrTextEditor >> errorBorder [

	^ BlBorder paint: Color red width: 1
]

{ #category : 'accessing' }
MABrTextEditor >> errors [
	^ errors ifNil: [ false "MAMultipleErrors new" ]
]

{ #category : 'accessing' }
MABrTextEditor >> errors: anObject [
	errors := anObject
]

{ #category : 'accessing' }
MABrTextEditor >> hasErrors [
	^ self errors" collection isNotNil"
]

{ #category : 'accessing' }
MABrTextEditor >> header [
	^ header
]

{ #category : 'accessing' }
MABrTextEditor >> header: anObject [
	header := anObject
]

{ #category : 'accessing' }
MABrTextEditor >> initialize [
	super initialize.

	self
		beEditable;
		aptitude: MAGtInputFieldAptitude "BrGlamorousEditorAptitude + BrGlamorousInputFieldSpacingAptitude";
		geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
		vFitContent;
		hMatchParent;
		text: (self builder textUsing: self elementDescription).	"BrGlamorousEditableLabelAptitude"	"BrGlamorousButtonExteriorAptitude"
		
	self initializeListeners.
	self initializeCompletion
]

{ #category : 'accessing' }
MABrTextEditor >> initializeCompletion [

	self elementDescription propertyAt: #completions ifPresent: [ :comps |
		| compStrings compStrat |
		compStrings := comps value: self builder object.
		compStrat := self builder completionStrategy 
			completions: (GtPrefixTree withAll: compStrings);
			yourself.
		(self builder completionControllerClass on: self strategy: compStrat)
			showOnTextModification: true;
			install ].
]

{ #category : 'accessing' }
MABrTextEditor >> initializeListeners [

	"Handle typed in text"
	self editor
		when: BrTextEditorModifiedEvent
		do: [ :evt | self validate ].
	
	"Handle directly-set text e.g. `text: aText`"
	self
		when: BrEditorTextChanged
		do: [ :evt | self validate ]
]

{ #category : 'accessing' }
MABrTextEditor >> validate [
	[ 
		self elementDescription
			writeFromString: self text greaseString
			to: self builder memento.
		self elementDescription
			validate: (self builder memento readUsing: self elementDescription).
		self builder showValidationPassFor: self header 
	]
		on: MAReadError, MAMultipleErrors
		do: [  "on: MAMultipleErrors
	  		do: [ :err |
	  			self errors: err.
	  			self border: self errorBorder ]":err | 
			self errors: true.
			self builder showWarningFor: self header ]
]
