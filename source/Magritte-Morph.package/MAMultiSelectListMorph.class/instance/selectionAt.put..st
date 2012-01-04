accessing
selectionAt: anInteger put: aBoolean
	| option |
	option := self options at: anInteger.
	self value: (aBoolean
		ifTrue: [ self value copyWith: option ]
		ifFalse: [ self value copyWithout: option ]).
	self changed: #selected