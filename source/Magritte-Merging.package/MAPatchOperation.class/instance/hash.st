comparing
hash
	^ ((self receiver hash bitXor: self field hash) bitXor: self oldValue hash) bitXor: self newValue hash