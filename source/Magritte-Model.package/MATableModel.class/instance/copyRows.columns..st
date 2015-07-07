copying
copyRows: aRowCount columns: aColumnCount
	| table |
	table := self class rows: aRowCount columns: aColumnCount.
	1 to: (self rowCount min: aRowCount) do: [ :row |
		1 to: (self columnCount min: aColumnCount) do: [ :col |
			table
				uncheckedAt: row at: col
				put: (self uncheckedAt: row at: col) ] ].
	^ table