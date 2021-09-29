Class {
	#name : #MAMorphicDropList,
	#superclass : #MAMorphicList,
	#category : #'Magritte-Morph-Model'
}

{ #category : #'private-building' }
MAMorphicDropList >> buildMorphView [
	
	| list |
	list := DropListModel new.
	list
		items: self options;
		displayBlock: [ :e | 
			e
				ifNil: [ '' ]
				ifNotNil: [ self magritteDescription reference toString: e ] ];
		setSelectedItem: self value;
		whenSelectedItemChanged: [ :e | self value: e ].
	
	^ list buildWithSpec.
]
