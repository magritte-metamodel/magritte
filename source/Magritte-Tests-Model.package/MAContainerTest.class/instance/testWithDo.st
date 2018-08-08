tests-enumerating
testWithDo
	self description add: self child1; add: self child2.
	self description with: self description children
		do: [ :first :second | self assert: first = second ]