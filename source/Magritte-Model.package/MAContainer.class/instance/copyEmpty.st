copying
copyEmpty
	^ self copy
		setChildren: self class defaultCollection;
		yourself