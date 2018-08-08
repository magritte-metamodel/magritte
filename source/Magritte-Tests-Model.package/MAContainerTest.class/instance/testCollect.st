tests-enumerating
testCollect
	| collected |
	self description add: self child1; add: self child2.
	collected := self description collect: [ :each | each ].
	self assert: self description = collected.
	self deny: self description == collected.

	collected := self description collect: [ :each | each copy ].
	self assert: self description = collected.
	self deny: self description == collected.

	collected := self description collect: [ :each |
		each copy
			accessor: (MASelectorAccessor selector: #foo);
			yourself ].
	self deny: self description = collected.
	self deny: self description == collected