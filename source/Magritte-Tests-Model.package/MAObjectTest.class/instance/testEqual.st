tests-comparing
testEqual
	self assert: self instance = self instance.
	self assert: self instance = self instance copy.
	self assert: self instance copy = self instance.

	self deny: self instance = 123.
	self deny: self instance = String new