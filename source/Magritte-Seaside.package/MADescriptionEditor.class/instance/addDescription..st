actions-items
addDescription: aDescription
	self
		show: (self buildEditorFor: aDescription titled: 'Add ' , aDescription class label)
		onAnswer: [ :element | element isNil ifFalse: [ self appendDescription: element ] ]