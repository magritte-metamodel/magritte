running
setUp
	table := (MATableModel rows: 3 columns: 4)
		collect: [ :row :col :value | row raisedTo: col ]