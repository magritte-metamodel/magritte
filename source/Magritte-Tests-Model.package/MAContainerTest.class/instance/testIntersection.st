tests-operators
testIntersection
	| a b union |
	a := self child1 , self child2.
	b := self child2 , self child3.
	union := a intersection: b.

	self assert: (union size) = 1.
	self deny: (union includes: self child1).
	self assert: (union includes: self child2).
	self deny: (union includes: self child3)