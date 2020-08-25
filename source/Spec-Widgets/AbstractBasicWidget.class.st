"
AbstractBasicWidget is an abstract class for basic widgets
"
Class {
	#name : #AbstractBasicWidget,
	#superclass : #ComposableModel,
	#instVars : [
		'helpHolder',
		'borderWidth',
		'borderColor',
		'enabledHolder'
	],
	#category : 'Spec-Widgets'
}

{ #category : #specs }
AbstractBasicWidget class >> defaultSpec [

	^ SpecLayout composed
]

{ #category : #protocol }
AbstractBasicWidget >> borderColor [
	<api: #inspect>
	"Return the border color"
	
	^ borderColor contents
]

{ #category : #protocol }
AbstractBasicWidget >> borderColor: aColor [
	<api: #color getter:#borderColor registration: #whenBorderColorChanged:>
	"Set the border width"
	
	borderColor contents: aColor 
]

{ #category : #protocol }
AbstractBasicWidget >> borderWidth [
	<api: #inspect>
	"Return the border width"
	
	^ borderWidth contents
]

{ #category : #protocol }
AbstractBasicWidget >> borderWidth: anInteger [
	<api: #integer min:0 max: 5 getter:#borderWidth registration: #whenBorderWidthChanged:>
	"Set the border width"
	
	borderWidth contents: anInteger
]

{ #category : #'as yet unclassified' }
AbstractBasicWidget >> buildWithSpec: aSpec [
	"Build the widget using the spec name provided as argument"
	| widget |
	
	(self spec notNil and: [ self needRebuild not ])
		ifTrue: [ ^ self widget ]
		ifFalse: [ widget := SpecInterpreter buildWidgetFor: self withSpec: aSpec ].

	self ensureExtentFor: widget.
	self ensureKeyBindingsFor: widget.
	
	self announce: (WidgetBuilt model: self widget: widget).
		
	^ widget
]

{ #category : #'as yet unclassified' }
AbstractBasicWidget >> buildWithSpecLayout: aSpecLayout [
	"Build the widget using the spec name provided as argument"
	| widget |
	
	(self spec notNil and: [ self needRebuild not ])
		ifTrue: [ ^ self widget ]
		ifFalse: [ widget := SpecInterpreter interpretASpec: aSpecLayout model: self ].
		
	self ensureExtentFor: widget.
	self ensureKeyBindingsFor: widget.
	
	self announce: (WidgetBuilt model: self widget: widget).
	
	^ widget
]

{ #category : #protocol }
AbstractBasicWidget >> color [

	^ self widget
		ifNil: [ Color white ]
		ifNotNil: [:w | w color ]
]

{ #category : #protocol }
AbstractBasicWidget >> color: aColor [

	^ self widget
		ifNotNil: [:w | w color: aColor ]
]

{ #category : #protocol }
AbstractBasicWidget >> disable [
	<api: #do>
	"Disable the label"
	
	self enabled: false
]

{ #category : #protocol }
AbstractBasicWidget >> enable [
	<api: #do>
	"Enable the label"
	
	self enabled: true
]

{ #category : #protocol }
AbstractBasicWidget >> enabled [
	<api: #inspect>
	^ enabledHolder contents
]

{ #category : #protocol }
AbstractBasicWidget >> enabled: aBoolean [
	<api: #boolean getter: #enabled registration: #whenEnabledChanged:>
	"Set if the button is enabled (clickable)"
	
	enabledHolder contents: aBoolean
]

{ #category : #protocol }
AbstractBasicWidget >> help [
	<api: #inspect>
	"Return the ballon text"
	
	^ helpHolder contents
]

{ #category : #protocol }
AbstractBasicWidget >> help: aString [
	<api: #string getter:#help registration: #whenHelpChanged:>
	"Set the help string"
	
	helpHolder contents: aString
]

{ #category : #initialization }
AbstractBasicWidget >> initialize [
	"Initialization code for AbstractBasicWidget"

	super initialize.

	helpHolder := nil asValueHolder.
	borderWidth := 0 asValueHolder.
	borderColor := Color transparent asValueHolder.
	enabledHolder := true asValueHolder.
	
	helpHolder whenChangedDo: [:string | 
		self widget ifNotNil: [:w | w setBalloonText: string ]].
	
	borderWidth whenChangedDo: [:int | 
		self widget ifNotNil: [:w | w borderWidth: int ]].
	
	borderColor whenChangedDo: [:color | 
		self widget ifNotNil: [:w | w borderColor: color ]].
	
	enabledHolder whenChangedDo: [:b |
		self widget ifNotNil: [:w | w enabled: b ]].
]

{ #category : #initialization }
AbstractBasicWidget >> initializeWidgets [ 
	"ignore this method since there is no composition in basic widgets"
]

{ #category : #'protocol-events' }
AbstractBasicWidget >> whenBorderColorChanged: aBlock [
	<api: #event>
	"Set a block to be performed when the brder width changed"
	
	borderColor whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
AbstractBasicWidget >> whenBorderWidthChanged: aBlock [
	<api: #event>
	"Set a block to be performed when the brder width changed"
	
	borderWidth whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
AbstractBasicWidget >> whenEnabledChanged: aBlock [
	<api: #event>
	"Set a block to performed when the widget is enabled or disabled"
	
	enabledHolder whenChangedDo: aBlock
]

{ #category : #'protocol-events' }
AbstractBasicWidget >> whenHelpChanged: aBlock [
	<api: #event>
	"Set a block to be performed when the help changed"
	
	helpHolder whenChangedDo: aBlock
]
