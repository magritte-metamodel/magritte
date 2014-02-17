accessing-properties
defaultKind
	self sorted ifTrue: [ ^SortedCollection ].
	self ordered ifTrue: [ ^OrderedCollection ].
	^super defaultKind