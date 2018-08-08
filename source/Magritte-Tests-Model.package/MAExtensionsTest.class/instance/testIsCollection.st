tests-collection
testIsCollection
	self deny: Object new isCollection.
	self deny: nil isCollection.
	self deny: 123 isCollection.
	self assert: 'abc' isCollection.
	self assert: #(a b c) isCollection