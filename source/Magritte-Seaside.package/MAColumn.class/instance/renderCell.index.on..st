rendering
renderCell: anObject index: anInteger on: html
	html tableData
		class: self tableDataClass;
		with: [ self renderer valueWithEnoughArguments: (Array with: anObject with: html with: anInteger) ]