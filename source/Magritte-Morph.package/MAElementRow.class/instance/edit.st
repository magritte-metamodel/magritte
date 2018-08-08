callbacks
edit

	object asMagritteMorph
		onAnswer: [ :result | self summary: result printString ];
		addButtons;
		addWindow;
		openInWorld.