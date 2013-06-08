actions
add

	self selection new asMorph
		onAnswer: [ :result |
			result isNil ifFalse: [ Halt now. self value: (self value copyWith: result) ] ];
		addButtons; 
		addWindow;
		openInWorld.