tests-operators
testConcatenation
	| child1 child2 concatenate |
	child1 := self description copy.
	child2 := self description copy.

	concatenate := child1 , child2.
	self assert: concatenate size = 2.
	self assert: concatenate children first = child1.
	self assert: concatenate children second = child2.

	concatenate := child1 , concatenate.
	self assert: concatenate size = 3.
	self assert: concatenate children first = child1.
	self assert: concatenate children second = child1.
	self assert: concatenate children third = child2