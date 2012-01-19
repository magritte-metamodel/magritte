private
optionsWithIndexDo: elementAndIndexBlock separatedBy: separatorBlock
	| index |
	index := 1.
	self magritteDescription allOptions
		do: [ :each |
			elementAndIndexBlock value: each value: index.
			index := index + 1 ]
		separatedBy: separatorBlock