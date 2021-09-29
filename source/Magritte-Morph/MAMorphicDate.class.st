Class {
	#name : #MAMorphicDate,
	#superclass : #MAMorphicElement,
	#category : #'Magritte-Morph-Model'
}

{ #category : #'private-building' }
MAMorphicDate >> buildMorphView [
	| model |
	model := DateModel new
		displayBlock: [ :e | self magritteDescription toString: e ];
		date: self value;
		whenDateChanged: [ :newDate | self value: newDate ];
		yourself.
	^ model buildWithSpec
			yourself.
]
