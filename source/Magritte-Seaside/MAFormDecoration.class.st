"
I surround the owning component with a XHTML form element and render the form buttons.
"
Class {
	#name : #MAFormDecoration,
	#superclass : #MAContainerDecoration,
	#instVars : [
		'buttons'
	],
	#category : 'Magritte-Seaside-Decorations'
}

{ #category : #'instance creation' }
MAFormDecoration class >> buttons: aCollection [
	^ self new
		addButtons: aCollection;
		yourself
]

{ #category : #actions }
MAFormDecoration >> addButton: aSymbol [
	self addButton: aSymbol label: (self labelForSelector: aSymbol)
]

{ #category : #actions }
MAFormDecoration >> addButton: aSymbolOrOneArgumentBlock label: aString [
	self buttons add: aSymbolOrOneArgumentBlock -> aString
]

{ #category : #actions }
MAFormDecoration >> addButtons: aCollection [
	aCollection do: [ :each |
		each isVariableBinding
			ifFalse: [ self addButton: each ]
			ifTrue: [ self addButton: each key label: each value ] ]
]

{ #category : #accessing }
MAFormDecoration >> buttons [
	^ buttons
]

{ #category : #accessing }
MAFormDecoration >> buttons: aCollection [
	buttons := aCollection
]

{ #category : #initialization }
MAFormDecoration >> initialize [
	super initialize.
	self buttons: OrderedCollection new
]
