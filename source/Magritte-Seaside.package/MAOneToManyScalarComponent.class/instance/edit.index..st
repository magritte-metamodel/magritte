actions
edit: anObject index: anInteger 
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