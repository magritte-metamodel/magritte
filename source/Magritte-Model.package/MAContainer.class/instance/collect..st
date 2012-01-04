enumerating
collect: aBlock
	^ self copy
		setChildren: (self children collect: aBlock);
		yourself