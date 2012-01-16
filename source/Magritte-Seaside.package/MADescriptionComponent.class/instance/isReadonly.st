testing
isReadonly
	^ self description isReadonly
		or: [ self isRoot not
		and: [ self parent isReadonly ] ]