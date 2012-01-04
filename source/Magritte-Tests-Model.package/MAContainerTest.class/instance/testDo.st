tests-enumerating
testDo
	| collection children |
	collection := self description class defaultCollection.
	self description add: self child1; add: self child2.
	self description do: [ :each | collection add: each ].
	children := self description children.
	self assert: children size = collection size.
	1 to: collection size do: [ :index |
		self assert: (children at: index) = (collection at: index) ]