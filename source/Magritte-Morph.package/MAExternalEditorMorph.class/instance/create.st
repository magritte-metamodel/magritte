actions
create
	self newRelation asMagritteMorph
		onAnswer: [ :result | result isNil ifFalse: [ self value: result ] ];
		addButtons; 
		addWindow;
		openInWorld