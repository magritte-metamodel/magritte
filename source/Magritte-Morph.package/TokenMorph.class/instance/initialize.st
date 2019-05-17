accessing
initialize
	super initialize.
	self roundedCorners: #(1 2 3 4).	"Seems to do nothing"
	self
		color:
			Smalltalk ui theme buttonColor;
		changeTableLayout;
		vResizing: #shrinkWrap;
		hResizing: #shrinkWrap;
		layoutInset: 5 @ 1