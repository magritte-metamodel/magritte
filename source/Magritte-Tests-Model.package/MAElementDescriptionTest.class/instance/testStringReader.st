tests-accessing
testStringReader
	| object |
	self description stringReader: (object := MAStringReader new).
	self assert: self description stringReader = object