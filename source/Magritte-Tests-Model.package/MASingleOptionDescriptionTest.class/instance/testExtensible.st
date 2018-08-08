tests-properties
testExtensible
	self description beExtensible.
	self assert: self description isExtensible.
	self assert: self description extensible.

	self description beLimited.
	self deny: self description isExtensible.
	self deny: self description extensible