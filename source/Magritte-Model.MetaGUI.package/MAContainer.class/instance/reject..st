enumerating
reject: aBlock
	^ self copy
		setChildren: (self children reject: aBlock);
		yourself