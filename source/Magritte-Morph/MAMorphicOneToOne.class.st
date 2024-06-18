Class {
	#name : #MAMorphicOneToOne,
	#superclass : #MAMorphicRelation,
	#category : #'Magritte-Morph-Model'
}

{ #category : #private }
MAMorphicOneToOne >> buildMorphView [

	| table |
	table := self rectangleMorph
		listDirection: #topToBottom;
		yourself.
	self value
		ifNotNil: [ MAElementRow addMorphFor: self value of: self to: table ]
		ifNil: [ self addSelectListTo: table ].
	^ table.
]

{ #category : #private }
MAMorphicOneToOne >> buildSelectButton [
	^ self theme builder
		newButtonFor: self
		action: #create
		label: 'Create'
		help: ''
]

{ #category : #actions }
MAMorphicOneToOne >> create [
	self subclassResponsibility
]

{ #category : #removing }
MAMorphicOneToOne >> remove: anObject [
	self value: nil
]
