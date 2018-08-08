rendering-table
renderTableHeadOn: html
	html tableRow: [
		self visibleColumns do: [ :each |
			each renderHeadCellOn: html ] ]