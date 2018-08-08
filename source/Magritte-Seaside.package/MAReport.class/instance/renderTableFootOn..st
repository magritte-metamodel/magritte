rendering-table
renderTableFootOn: html
	html tableRow: [
		self visibleColumns do: [ :each |
			each renderFootCellOn: html ] ]