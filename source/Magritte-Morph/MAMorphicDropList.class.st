Class {
	#name : #MAMorphicDropList,
	#superclass : #MAMorphicList,
	#category : #'Magritte-Morph-Model'
}

{ #category : #'private-building' }
MAMorphicDropList >> buildMorphView [

	^ SpDropListPresenter new
		  items: self options;
		  display: [ :e | 
			  e
				  ifNil: [ '' ]
				  ifNotNil: [ self magritteDescription reference toString: e ] ];
		  selectItem: self value;
		  whenSelectedItemChangedDo: [ :e | self value: e ];
		  build
]
