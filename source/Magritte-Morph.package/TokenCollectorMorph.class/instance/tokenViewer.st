private-building
tokenViewer
	tokenViewer ifNotNil: [ ^ tokenViewer ].
	^ tokenViewer := Morph new
			color: UITheme current backgroundColor;
			changeTableLayout;
			vResizing: #spaceFill;
			hResizing: #spaceFill;
			listDirection: #leftToRight;
			wrapDirection: #topToBottom;
			cellInset: 5 @ 5;
			yourself.