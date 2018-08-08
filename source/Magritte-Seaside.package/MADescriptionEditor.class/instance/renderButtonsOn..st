rendering
renderButtonsOn: html
	html submitButton
		callback: [
			selectedComponent save.
			selected contents isNil
				ifFalse: [ self addDescription: selected contents new ] ];
		text: 'Add'.
	super renderButtonsOn: html