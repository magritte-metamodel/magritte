Class {
	#name : #MAMorphicElement,
	#superclass : #MAMorphicDescription,
	#category : #'Magritte-Morph-Model'
}

{ #category : #'private-building' }
MAMorphicElement >> buildMorphLabel [
	^ self stringMorph
		contents: self magritteDescription label , ':';
		width: 100;
		yourself
]

{ #category : #'private-building' }
MAMorphicElement >> buildMorphRequired [
	^ self stringMorph
		contents: ' *';
		color: Color red;
		yourself
]

{ #category : #'private-building' }
MAMorphicElement >> buildMorphView [

	^ self stringMorph
		contents: self string;
		yourself
]

{ #category : #'private-building' }
MAMorphicElement >> buildMorphViewOn: aMorph [

	aMorph
		layoutInset: 1 @ 1;
		listDirection: #leftToRight;
		addMorphBack: self buildMorphLabel;
		addMorphBack: self buildMorphView.
	self magritteDescription hasComment
		ifTrue: [ aMorph setBalloonText: self magritteDescription comment ].
	self magritteDescription isRequired
		ifTrue: [ aMorph addMorphBack: self buildMorphRequired ]
]

{ #category : #accessing }
MAMorphicElement >> string [
	^ self magritteDescription toString: self value
]

{ #category : #accessing }
MAMorphicElement >> string: aString [
	| value |
	value := self magritteDescription fromString: aString greaseString.
	self value: value; changed: #string
]

{ #category : #accessing }
MAMorphicElement >> value [
	^ self magritteDescription read: self memento
]

{ #category : #accessing }
MAMorphicElement >> value: anObject [
	self magritteDescription write: anObject to: self memento.
	self changed: #value
]
