Class {
	#name : #MAMorphicRelation,
	#superclass : #MAMorphicElement,
	#instVars : [
		'selected',
		'selectedIndex'
	],
	#category : #'Magritte-Morph-Model'
}

{ #category : #'private-building' }
MAMorphicRelation >> addSelectListTo: aMorph [

	self classes ifEmpty: [ ^ self ].
	aMorph addMorphBack: self buildSelectList
]

{ #category : #'private-building' }
MAMorphicRelation >> buildClassChooser [
	| items |
	items := self classes collect: [ :e | e label ].
	^ Smalltalk ui theme builder
		newDropListFor: self
		list: items
		getSelected: #selectedIndex
		setSelected: #selectedIndex:
		help: ''
]

{ #category : #'private-building' }
MAMorphicRelation >> buildSelectButton [
	self subclassResponsibility
]

{ #category : #'private-building' }
MAMorphicRelation >> buildSelectList [

	| list |
	list := self rectangleMorph
		listDirection: #leftToRight;
		yourself.
	self classes size > 1 ifTrue: [ list addMorphBack: self buildClassChooser ].
	^ list 
			addMorphBack: self buildSelectButton;
			yourself.
]

{ #category : #'accessing-dynamic' }
MAMorphicRelation >> classes [

	^ self magritteDescription classes asSortedCollection: #name ascending.
]

{ #category : #private }
MAMorphicRelation >> newRelation [

	| instance |
	instance := self selected new.
	self magritteDescription initializer value: instance.
	^ instance

]

{ #category : #accessing }
MAMorphicRelation >> selected [
	^ self classes at: self selectedIndex
]

{ #category : #private }
MAMorphicRelation >> selectedIndex [
	^ selectedIndex ifNil: [ selectedIndex := 1 ]
]

{ #category : #private }
MAMorphicRelation >> selectedIndex: anInteger [
	selectedIndex := anInteger.
]
