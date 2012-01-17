rendering
renderCellContent: anObject on: html
	self component setMemento: (anObject mementoClass
			model: anObject
			description: self magritteDescription asContainer).
	self component renderViewerOn: html