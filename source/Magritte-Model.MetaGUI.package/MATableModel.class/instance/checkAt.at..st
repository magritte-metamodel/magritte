private
checkAt: aRowIndex at: aColumnIndex
	(aRowIndex between: 1 and: self rowCount)
		ifFalse: [ self error: 'Row subscript out of range.' ].
	(aColumnIndex between: 1 and: self columnCount)
		ifFalse: [ self error: 'Column subscript out of range.' ]