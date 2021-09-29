Class {
	#name : 'MAPillarRenderer',
	#superclass : 'MAVisitor',
	#instVars : [
		'object',
		'pillarStack',
		'objectDescription'
	],
	#category : 'Magritte-Pillar'
}

{ #category : 'adding' }
MAPillarRenderer >> add: aPRDocumentItem [
	self pillarStack top add: aPRDocumentItem
]

{ #category : 'accessing' }
MAPillarRenderer >> object [
	^ object
]

{ #category : 'accessing' }
MAPillarRenderer >> object: anObject [
	object := anObject
]

{ #category : 'accessing' }
MAPillarRenderer >> objectDescription [
	^ objectDescription ifNil: [ objectDescription := self object magritteDescription ]
]

{ #category : 'accessing' }
MAPillarRenderer >> objectDescription: aDescription [
	"Motivation: By way of example, let's say you have a music library with different types of items, but you only want to render songs, you might say:
		```smalltalk
			aRenderer objectDescription: (anObject magritteDescription select: [ :e | e label = 'Songs' ])```"
	objectDescription := aDescription
]

{ #category : 'private' }
MAPillarRenderer >> pillarStack [
	^ pillarStack ifNil: [ pillarStack := Stack new ]
]

{ #category : 'private' }
MAPillarRenderer >> pillarStack: anObject [
	pillarStack := anObject
]

{ #category : 'private' }
MAPillarRenderer >> push: aPRDocumentItemOrCollection do: aBlock [
	aPRDocumentItemOrCollection maPillarPushTo: self pillarStack do: aBlock
]

{ #category : 'private-rendering' }
MAPillarRenderer >> renderContainer: aDescription [
	self
		push: PRTable new
		do: [ 
			self add: (self rowOfText: self object printString).
			aDescription isEmpty ifTrue: [ ^ self ].
			self
				push: { PRTableRow new. PRTableCell new. PRTable new }
				do: [ self visitAll: (aDescription select: [ :each | each isVisible ]) ] ]
]

{ #category : 'private-rendering' }
MAPillarRenderer >> renderControl: aDescription [ 
	self add: (PRTableCell new add: (aDescription pillarFor: self object); yourself)
]

{ #category : 'private-rendering' }
MAPillarRenderer >> renderElement: aDescription [
	"aDescription group = group
		ifFalse: [ self renderGroup: aDescription ]."

	self
		push: PRTableRow new
		do: [ 
			self renderLabel: aDescription.
			self renderControl: aDescription ]
]

{ #category : 'private-rendering' }
MAPillarRenderer >> renderLabel: aDescription [
	aDescription hasLabel ifFalse: [ ^ self ].
	"label := html label.
	(self childAt: aDescription) hasLabelId
		ifTrue: [ label for: (self childAt: aDescription) labelId ].
	label with: [ html render: aDescription label; text: ':' ]"
	self add: (PRTableCell new add: (PRText content: aDescription label, ':'); yourself )
]

{ #category : 'private-rendering' }
MAPillarRenderer >> renderOn: aPRDocumentItem [
	self pillarStack push: aPRDocumentItem.
	self visit: self objectDescription
]

{ #category : 'private' }
MAPillarRenderer >> rowOfText: aString [
	| text cell |
	text := PRText content: aString.
	cell := PRTableCell new
		add: text;
		yourself.
	^ PRTableRow new
		add: cell;
		yourself
]

{ #category : 'private-visiting-description' }
MAPillarRenderer >> visitContainer: aDescription [
	self renderContainer: aDescription
]

{ #category : 'private-visiting-description' }
MAPillarRenderer >> visitElementDescription: aDescription [
	self renderElement: aDescription
]
