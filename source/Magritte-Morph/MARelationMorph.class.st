Class {
	#name : #MARelationMorph,
	#superclass : #MAElementMorph,
	#instVars : [
		'selected',
		'selectedIndex'
	],
	#category : 'Magritte-Morph-Model'
}

{ #category : #'private-building' }
MARelationMorph >> addSelectListTo: aMorph [

	self classes ifEmpty: [ ^ self ].
	aMorph addMorphBack: self buildSelectList
]

{ #category : #'private-building' }
MARelationMorph >> buildClassChooser [
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
MARelationMorph >> buildSelectButton [
	self subclassResponsibility
]

{ #category : #'private-building' }
MARelationMorph >> buildSelectList [

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
MARelationMorph >> classes [

	^ self magritteDescription classes asSortedCollection: [ :a :b | a name < b name ].
]

{ #category : #private }
MARelationMorph >> newRelation [

	| instance |
	instance := self selected new.
	self magritteDescription initializer value: instance.
	^ instance

]

{ #category : #accessing }
MARelationMorph >> selected [
	^ self classes at: self selectedIndex
]

{ #category : #private }
MARelationMorph >> selectedIndex [
	^ selectedIndex ifNil: [ selectedIndex := 1 ]
]

{ #category : #private }
MARelationMorph >> selectedIndex: anInteger [
	selectedIndex := anInteger.
]
