tests-enumerating
testReject
	| rejected |
	self description add: self child1; add: self child2.

	rejected := self description reject: [ :each | false ].
	self assert: self description = rejected.

	rejected := self description reject: [ :each | true ].
	self assert: rejected isEmpty