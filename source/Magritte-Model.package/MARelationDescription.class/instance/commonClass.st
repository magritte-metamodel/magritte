accessing-dynamic
commonClass
	"Answer a common superclass of the classes of the receiver. The algorithm is implemented to be as efficient as possible. The inner loop will be only executed the first few iterations."

	| current |
	self classes isEmpty
		ifTrue: [ ^ self descriptionContainer ].
	current := self classes anyOne.
	self classes do: [ :each |
		[ each includesBehavior: current ]
			whileFalse: [ current := current superclass ] ].
	^ current