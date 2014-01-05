actions
create
	self selected new asMorph
		onAnswer: [ :result | result isNil ifFalse: [ self value: result ] ];
		addButtons; 
		addWindow;
		openInWorld