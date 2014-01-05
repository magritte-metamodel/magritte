callbacks
edit

	object asMorph
		onAnswer: [ :result | self summary: result printString ];
		addButtons;
		addWindow;
		openInWorld.