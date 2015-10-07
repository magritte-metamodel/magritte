initialization
initialize

	super initialize.
	self changeTableLayout.
	self
		addMorphBack: self textInput;
		addMorphBack: self tokenViewer