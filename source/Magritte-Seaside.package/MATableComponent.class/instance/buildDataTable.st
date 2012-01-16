private
buildDataTable
	^ MATableModel
		rows: self description rowCount
		columns: self description columnCount