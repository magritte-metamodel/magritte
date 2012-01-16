exporting
exportBodyOn: aStream
	self cache keysAndValuesDo: [ :index :row |
		self visibleColumns
			do: [ :column |
				column
					exportContent: (column valueFor: row)
					index: index on: aStream ]
			separatedBy: [ aStream tab ].
		aStream nextPut: Character cr ]