initialization
setDescription: aDescription
	magritteDescription := nil.
	super setDescription: aDescription.
	self setChildren: self buildChildren