actions-items
editDescription: aDescription
	self
		show: (self
			buildEditorFor: aDescription
			titled: 'Edit ' , aDescription class label)
		onAnswer: [ self refresh ]