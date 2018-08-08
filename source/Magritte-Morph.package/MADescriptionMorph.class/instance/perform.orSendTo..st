private-morphic
perform: selector orSendTo: otherTarget
	^ (self respondsTo: selector)
		ifTrue: [ self perform: selector ]
		ifFalse: [ otherTarget perform: selector ]