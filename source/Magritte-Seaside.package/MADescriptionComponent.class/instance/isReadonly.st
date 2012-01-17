testing
isReadonly
	^ self magritteDescription isReadonly
		or: [ self isRoot not
		and: [ self parent isReadonly ] ]