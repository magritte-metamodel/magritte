testing
canWrite: aModel
	^ (super canRead: aModel) and: [ self accessor canWrite: (self next read: aModel) ]