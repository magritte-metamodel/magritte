actions
create
	self selected new asMagritteMorph
		onAnswer: [ :result | result isNil ifFalse: [ self value: result ] ];
		addButtons; 
		addWindow;
		openInWorld