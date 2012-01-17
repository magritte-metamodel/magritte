private
buildDataTable
	^ MATableModel
		rows: self magritteDescription rowCount
		columns: self magritteDescription columnCount