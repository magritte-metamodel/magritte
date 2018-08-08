tests-accessing
testStringWriter
	| object |
	self description stringWriter: (object := MAStringWriter new).
	self assert: self description stringWriter = object