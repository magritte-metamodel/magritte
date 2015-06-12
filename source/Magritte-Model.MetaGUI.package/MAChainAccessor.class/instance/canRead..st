testing
canRead: aModel
	^ (super canRead: aModel) and: [ self accessor canRead: (self next read: aModel) ]