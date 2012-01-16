private
optionsWithIndexDo: elementAndIndexBlock separatedBy: separatorBlock
	| index |
	index := 1.
	self options
		do: [ :each |
			elementAndIndexBlock value: each value: index.
			index := index + 1 ]
		separatedBy: separatorBlock