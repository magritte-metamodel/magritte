prototypes
rectangleMorph
	^ RectangleMorph new
		borderWidth: 0;
		color: Color transparent;
		layoutPolicy: TableLayout new;
		cellPositioning: #topLeft;
		vResizing: #shrinkWrap;
		hResizing: #spaceFill;
		yourself