actions
add

	self selected new asMorph
		onAnswer: [ :result |
			result isNil ifFalse: [ self value: (self value copyWith: result) ] ];
		addButtons; 
		addWindow;
		openInWorld