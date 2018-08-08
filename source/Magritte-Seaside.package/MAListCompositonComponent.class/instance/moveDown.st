actions
moveDown
	self selectedSelected isNil
		ifFalse: [ self selectedList moveDown: self selectedSelected ]