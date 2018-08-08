actions
remove: anObject
	self value: (self value copyWithout: anObject).
	self refresh