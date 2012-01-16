rendering
renderCellContent: anObject on: html
	html render: (self description reference toString: (self valueFor: anObject))