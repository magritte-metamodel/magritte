testing
isReadOnly
	^ self magritteDescription isReadOnly
		or: [ self isRoot not
		and: [ self parent isReadOnly ] ]