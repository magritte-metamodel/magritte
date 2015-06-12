*magritte-model
moveUp: anObject
	| first second |

	first := self findFirst: [ :value | value == anObject ].
	second := first > 1 ifTrue: [ first - 1 ] ifFalse: [ ^ first ].
	self swap: first with: second.
	^ second