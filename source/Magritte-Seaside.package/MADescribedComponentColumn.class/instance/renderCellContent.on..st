rendering
renderCellContent: anObject on: html
	self component setMemento: (anObject mementoClass
			model: anObject
			description: self description asContainer).
	self component renderViewerOn: html