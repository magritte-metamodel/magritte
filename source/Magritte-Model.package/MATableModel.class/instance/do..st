enumeration
do: aBlock
	1 to: self rowCount do: [ :row |
		1 to: self columnCount do: [ :col |
			aBlock
				value: row value: col
				value: (self uncheckedAt: row at: col) ] ]