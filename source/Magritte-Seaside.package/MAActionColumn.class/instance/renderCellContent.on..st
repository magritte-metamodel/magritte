rendering
renderCellContent: anObject on: html
	self useLinks
		ifTrue: [ self renderCellLinkContent: anObject on: html ]
		ifFalse: [ self renderCellFormContent: anObject on: html ]