rendering
renderCellContent: anObject on: html
	html render: (self formatter value: (self valueFor: anObject))