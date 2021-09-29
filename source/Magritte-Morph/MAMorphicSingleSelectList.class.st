Class {
	#name : #MAMorphicSingleSelectList,
	#superclass : #MAMorphicList,
	#category : #'Magritte-Morph-Model'
}

{ #category : #private }
MAMorphicSingleSelectList >> buildMorphView [
	^ (PluggableListMorph on: self list: #strings selected: #selected changeSelected: #selected:)
		hResizing: #spaceFill;
		borderColor: #inset;
		borderWidth: 1;
		yourself
]

{ #category : #accessing }
MAMorphicSingleSelectList >> selected [
	^ self options indexOf: self value
]

{ #category : #accessing }
MAMorphicSingleSelectList >> selected: anInteger [
	self value: (self options at: anInteger ifAbsent: [ nil ]).
	self changed: #selected
]
