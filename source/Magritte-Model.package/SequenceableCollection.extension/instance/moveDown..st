*magritte-model
moveDown: anObject
	| first second |
	first := self findFirst: [ :value | value == anObject ].
	second := (first > 0 and: [ first < self size ])
		ifTrue: [ first + 1 ]
		ifFalse: [ ^ first ].
	self swap: first with: second.
	^ second