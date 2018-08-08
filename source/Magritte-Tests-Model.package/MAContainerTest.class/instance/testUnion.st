tests-operators
testUnion
	| a b union |
	a := self child1 , self child2.
	b := self child2 , self child3.
	union := a union: b.

	self assert: (union size) = 3.
	self assert: (union includes: self child1).
	self assert: (union includes: self child2).
	self assert: (union includes: self child3)