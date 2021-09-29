Class {
	#name : #MAMorphicOneToOne,
	#superclass : #MAMorphicRelation,
	#category : #'Magritte-Morph-Model'
}

{ #category : #'as yet unclassified' }
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
	^ Smalltalk ui theme builder
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
