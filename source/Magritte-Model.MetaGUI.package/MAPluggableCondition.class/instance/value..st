evaluating
value: anObject
	| actualReceiver actualArguments |
	actualReceiver := index = 0
		ifFalse: [ receiver ]
		ifTrue: [ anObject ].
	actualArguments := index > 0
		ifFalse: [ arguments ]
		ifTrue: [
			arguments copy 
				at: index put: anObject;
				yourself ].
	^ actualReceiver
		perform: selector
		withArguments: actualArguments