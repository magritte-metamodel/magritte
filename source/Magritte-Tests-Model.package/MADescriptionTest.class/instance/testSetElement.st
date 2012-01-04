tests-identity
testSetElement
	| set |
	set := Set new.

	set add: self instance.
	self assert: set size = 1.
	self assert: (set includes: self instance).

	set add: self instance.
	self assert: set size = 1.
	self assert: (set includes: self instance)