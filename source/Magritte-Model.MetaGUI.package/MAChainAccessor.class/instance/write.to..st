model
write: anObject to: aModel
	self accessor write: anObject to: (super read: aModel)