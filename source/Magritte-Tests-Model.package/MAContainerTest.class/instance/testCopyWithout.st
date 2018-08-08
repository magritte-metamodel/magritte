tests-copying
testCopyWithout
	| copied |
	self description add: self child1; add: self child2; add: self child3.
	copied := self description copyWithout: self child1.

	self assert: copied ~= self description.

	self assert: copied size = 2.
	self assert: copied children first = self child2.
	self assert: copied children second = self child3