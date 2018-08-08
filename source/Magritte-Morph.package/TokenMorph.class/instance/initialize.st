as yet unclassified
initialize
	super initialize.
	self roundedCorners: #(1 2 3 4). "Seems to do nothing"
	self
		color: UITheme current buttonColor;
		changeTableLayout;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		layoutInset: 5@1.