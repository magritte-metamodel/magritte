accessing
commandColumn
	^ commandColumn ifNil: [ commandColumn := self buildCommandColumn ]