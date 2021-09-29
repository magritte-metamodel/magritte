Class {
	#name : #MACommandColumn,
	#superclass : #MAActionColumn,
	#instVars : [
		'commands'
	],
	#category : 'Magritte-Seaside-Report'
}

{ #category : #actions }
MACommandColumn >> addCommand: aBlock text: aString [
	self commands add: aBlock -> aString
]

{ #category : #actions }
MACommandColumn >> addCommandOn: anObject selector: aSelector [
	self addCommandOn: anObject selector: aSelector text: aSelector allButLast asCapitalizedPhrase
]

{ #category : #actions }
MACommandColumn >> addCommandOn: anObject selector: aSelector text: aString [
	self addCommand: (MessageSend receiver: anObject selector: aSelector) text: aString
]

{ #category : #accessing }
MACommandColumn >> commands [
	^ commands
]

{ #category : #accessing }
MACommandColumn >> commands: aCollection [
	commands := aCollection
]

{ #category : #initialization }
MACommandColumn >> initialize [
	super initialize.
	self commands: OrderedCollection new
]

{ #category : #rendering }
MACommandColumn >> renderCellFormContent: anObject on: html [
	self commands
		do: [ :each |
			html submitButton
				callback: [ each key value: anObject ];
				text: each value ]
		separatedBy: [ html space ]
]

{ #category : #rendering }
MACommandColumn >> renderCellLinkContent: anObject on: html [
	self commands
		do: [ :each |
			html anchor
				callback: [ each key value: anObject ];
				with: each value ]
		separatedBy: [ html space ]
]
