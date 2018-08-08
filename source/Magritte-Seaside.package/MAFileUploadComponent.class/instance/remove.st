actions
remove
	self value isNil
		ifFalse: [ self value finalize ].
	self value: nil