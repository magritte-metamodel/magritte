Class {
	#name : #MAMorphicMultiSelectList,
	#superclass : #MAMorphicList,
	#instVars : [
		'selected'
	],
	#category : #'Magritte-Morph-Model'
}

{ #category : #private }
MAMorphicMultiSelectList >> buildMorphView [
	^ (PluggableListMorph on: self list: #strings primarySelection: #selected changePrimarySelection: #selected: listSelection: #selectionAt: changeListSelection: #selectionAt:put: menu: nil)
		hResizing: #spaceFill;
		borderColor: #inset;
		borderWidth: 1;
		beMultipleSelection;
		yourself
]

{ #category : #accessing }
MAMorphicMultiSelectList >> selected [
	^ selected ifNil: [ selected := 0 ]
]

{ #category : #accessing }
MAMorphicMultiSelectList >> selected: anInteger [
	selected := anInteger.
	self changed: #selected
]

{ #category : #accessing }
MAMorphicMultiSelectList >> selectionAt: anInteger [
	^ self value includes: (self options at: anInteger)
]

{ #category : #accessing }
MAMorphicMultiSelectList >> selectionAt: anInteger put: aBoolean [
	| option |
	option := self options at: anInteger.
	self value: (aBoolean
		ifTrue: [ self value copyWith: option ]
		ifFalse: [ self value copyWithout: option ]).
	self changed: #selected
]
