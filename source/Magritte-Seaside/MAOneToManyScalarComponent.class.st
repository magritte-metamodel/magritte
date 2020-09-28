Class {
	#name : #MAOneToManyScalarComponent,
	#superclass : #MAOneToManyComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #actions }
MAOneToManyScalarComponent >> add [
	| holder holderDescription |
	holder := MAValueHolder new.
	holderDescription := self reference copy
		accessor: (MASelectorAccessor selector: #contents);
		yourself.
	self root
		show: ((holderDescription asContainer asComponentOn: holder)
			addMessage: 'Add ' , self selected label;
			addValidatedForm;
			yourself)
		onAnswer: [ :answer |
			holder := answer.
			holder isNil
				ifFalse: [ self value: (self value copyWith: holder contents); refresh ] ]
]

{ #category : #private }
MAOneToManyScalarComponent >> buildCommandColumn [
	|retVal|
	retVal := MAIndexedCommandColumn new
				setReport: self report.

	self magritteDescription isDefinitive
		ifFalse: [ retVal
					addCommandOn: self selector: #edit:index: text: 'Edit';
					addCommandOn: self selector: #remove:index: text: 'Remove'].
	"not yet implemented
	self description isOrdered
		ifTrue: [ commands
					addCommandOn: self selector: #up:index:;
					addCommandOn: self selector: #down:index: ]. "

	^ retVal
]

{ #category : #private }
MAOneToManyScalarComponent >> buildReport [
	^ MAReport rows: self value description: self magritteDescription
]

{ #category : #actions }
MAOneToManyScalarComponent >> edit: anObject index: anInteger [ 
	"sorry, but a collection might include duplicates like #(1 2 1) and you only want to edit the one with the correct index"
	| holder holderDescription |
	holder := MAValueHolder on: anObject.
	holderDescription := self reference copy
		accessor: (MASelectorAccessor selector: #contents);
		yourself.
	self root
		show: ((holderDescription asContainer asComponentOn: holder)
			addMessage: 'Edit ' , self selected label;
			addValidatedForm;
			yourself)
		onAnswer: [ :answer |
			holder := answer.
			holder isNil ifTrue: [ ^ self ].
			self value: (self value isSequenceable 
				ifTrue: 
					[ self copy value
						at: anInteger
						put: holder contents;
						yourself ]
				ifFalse: 
					[ self value copy
						remove: anObject;
						add: holder contents;
						yourself ]).
			self refresh ]
]

{ #category : #actions }
MAOneToManyScalarComponent >> remove: anObject index: anInteger [
	"sorry, but a collection might include duplicates like #(1 2 1) and you only want to remove the one with the correct index"
	self value: (self value isSequenceable
		ifTrue: [ self value copyWithoutIndex: anInteger ]
		ifFalse: [ self value copyWithout: anObject ]).
	self refresh
]
