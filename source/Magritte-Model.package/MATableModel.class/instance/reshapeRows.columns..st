operations
reshapeRows: aRowCount columns: aColumnCount
	"Change the size of the receiving table to ==aRowCount== times ==aColumnCount==, throwing away elements that are cut off and initializing empty cells with ==nil==."

	self setContents: (self copyRows: aRowCount columns: aColumnCount) contents.
	self setRowCount: aRowCount; setColumnCount: aColumnCount