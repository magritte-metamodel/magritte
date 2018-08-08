actions
sort: aColumn
	aColumn = self sortColumn
		ifTrue: [
			self sortReversed
				ifFalse: [ self sortReversed: true ]
				ifTrue: [ self sortColumn: nil; sortReversed: false ] ]
		ifFalse: [ self sortColumn: aColumn; sortReversed: false ].
	self refresh