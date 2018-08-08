actions
remove
	self selectedSelected isNil
		ifTrue: [ ^ self ].
	self remove: self selectedSelected.
	self availableSelected: self selectedSelected.
	self selectedSelected: nil