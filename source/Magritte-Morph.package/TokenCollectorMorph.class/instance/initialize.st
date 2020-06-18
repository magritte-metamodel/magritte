initialization
initialize

	| scrollPane |
	super initialize.
	self
		changeTableLayout;
		color: Color transparent.
	self addMorphBack: self textInput.
	scrollPane := GeneralScrollPane new
			changeScrollerTableLayout;
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			scrollTarget: self tokenViewer;
			yourself.
	self addMorphBack: scrollPane