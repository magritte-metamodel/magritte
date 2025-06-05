Class {
	#name : 'MAMorphicDate',
	#superclass : 'MAMorphicElement',
	#category : 'Magritte-Morph-Model'
}

{ #category : 'private-building' }
MAMorphicDate >> buildMorphView [

	^ SpDatePresenter new
		  display: [ :e | self magritteDescription toString: e ];
		  date: self value;
		  whenDateChanged: [ :newDate | self value: newDate ];
		  build
]
