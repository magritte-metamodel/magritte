actions
add
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