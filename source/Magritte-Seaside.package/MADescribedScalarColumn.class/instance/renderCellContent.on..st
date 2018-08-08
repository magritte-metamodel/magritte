rendering
renderCellContent: anObject on: html
	html render: (self magritteDescription reference toString: (self valueFor: anObject))