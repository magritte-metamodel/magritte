private
initialize
	super initialize.
	self
		borderWidth: 0;
		color: Color transparent;
		layoutPolicy: TableLayout new;
		cellPositioning: #topLeft;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		listDirection: #leftToRight;
		cellInset: self cellInset;
		layoutInset: 0@2.
	self
		addMorphBack: (container magritteDescription displayStringFor: object) asMorph;
		addMorphBack: self buildCommands