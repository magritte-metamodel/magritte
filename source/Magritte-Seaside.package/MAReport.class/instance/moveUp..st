columns
moveUp: aColumn
	| index |
	index := self columns indexOf: aColumn ifAbsent: [ ^ self ].
	self columns swap: index with: (index = 1
		ifFalse:[ index - 1 ]
		ifTrue: [ self size ])