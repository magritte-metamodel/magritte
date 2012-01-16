actions
moveUp
	self selectedSelected isNil
		ifFalse: [ self selectedList moveUp: self selectedSelected ]