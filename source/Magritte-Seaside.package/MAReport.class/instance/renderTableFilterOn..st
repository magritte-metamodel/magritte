rendering-table
renderTableFilterOn: html
	html tableRow: [
		self visibleColumns do: [ :each |
			each renderFilterCellOn: html ] ]