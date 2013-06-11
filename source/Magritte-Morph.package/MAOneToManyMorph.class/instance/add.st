actions
add

	self selected new asMorph
		onAnswer: [ :result |
			result isNil ifFalse: [ self value: (self value copyWith: result) ].
			self add: result ];
		addButtons; 
		addWindow;
		openInWorld