tests-enumerating
testSelect
	| selected |
	self description add: self child1; add: self child2.

	selected := self description select: [ :each | true ].
	self assert: self description = selected.

	selected := self description select: [ :each | false ].
	self assert: selected isEmpty