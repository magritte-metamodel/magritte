tests-enumerating
testDoSepratedBy
	| collection |
	collection := OrderedCollection new.
	self description add: self child1; add: self child2.
	self description
		do: [ :each | collection add: each ]
		separatedBy: [ collection add: nil ].
	self assert: collection size = 3.
	self assert: collection first = self child1.
	self assert: collection second isNil.
	self assert: collection third = self child2