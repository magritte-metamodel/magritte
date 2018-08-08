tests-copying
testCopyWithoutAll
	| copied |
	self description add: self child1; add: self child2; add: self child3.
	copied := self description copyWithoutAll: (Array with: self child1 with: self child3).

	self assert: copied ~= self description.

	self assert: copied size = 1.
	self assert: copied children first = self child2