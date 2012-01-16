rendering-table
renderTableBodyOn: html 
	self visible isEmpty 
		ifTrue: [ 
			html tableRow
				class: 'empty';
				with: [ 
					html tableData
						colSpan: self visibleColumns size;
						with: self tableEmpty ] ]
		ifFalse: [
			self visible keysAndValuesDo: [ :index :row | 
				html tableRow
					class: (self rowStyleForNumber: index);
					with: [ 
						self visibleColumns do: [ :col | 
							col 
								renderCell: row
								index: index
								on: html ] ] ] ]