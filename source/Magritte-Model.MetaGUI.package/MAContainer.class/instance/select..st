enumerating
select: aBlock
	^ self copy
		setChildren: (self children select: aBlock);
		yourself