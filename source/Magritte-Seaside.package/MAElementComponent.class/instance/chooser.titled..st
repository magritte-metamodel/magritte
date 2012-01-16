calling
chooser: aComponent titled: aString
	self root
		show: (aComponent
			addMessage: aString;
			yourself)
		onAnswer: [ :result |
			result isNil
				ifFalse: [ self value: result ] ]