removing
remove: aDescription
	self children remove: aDescription ifAbsent: [ self errorNotFound: aDescription ]