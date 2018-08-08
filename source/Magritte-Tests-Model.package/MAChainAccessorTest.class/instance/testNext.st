tests
testNext
	| next |
	next := #foo asAccessor.
	self accessor next: next.
	self assert: self accessor next = next