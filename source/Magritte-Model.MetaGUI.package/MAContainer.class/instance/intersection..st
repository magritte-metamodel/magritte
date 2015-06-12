enumerating
intersection: aCollection
	^ self copy
		setChildren: (self children intersection: aCollection);
		yourself