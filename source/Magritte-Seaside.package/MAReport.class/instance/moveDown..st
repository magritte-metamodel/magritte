columns
moveDown: aColumn
	| index |
	index := self columns indexOf: aColumn ifAbsent: [ ^ self ].
	self columns swap: index with: (index = self size
		ifFalse:[ index + 1 ]
		ifTrue: [ 1 ])