actions
nextPage
	self isOnLastPage
		ifFalse: [ self batchPage: self batchPage + 1 ]