initialization
initialize

	super initialize.
	self
		changeTableLayout;
		vResizing: #shrinkWrap.
	self
		addMorphBack: self textInput;
		addMorphBack: self tokenViewer