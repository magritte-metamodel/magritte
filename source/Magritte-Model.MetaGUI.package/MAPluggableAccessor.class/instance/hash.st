comparing
hash
	^ super hash bitXor: (self readBlock hash bitXor: self writeBlock hash)