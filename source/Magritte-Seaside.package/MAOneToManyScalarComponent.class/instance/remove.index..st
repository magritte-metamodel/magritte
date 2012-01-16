actions
remove: anObject index: anInteger
	"sorry, but a collection might include duplicates like #(1 2 1) and you only want to remove the one with the correct index"
	self value: (self value isSequenceable
		ifTrue: [ self value copyWithoutIndex: anInteger ]
		ifFalse: [ self value copyWithout: anObject ]).
	self refresh