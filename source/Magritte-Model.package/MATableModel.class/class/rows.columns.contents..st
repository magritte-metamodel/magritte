instance creation
rows: aRowCount columns: aColumnCount contents: anArray
	^ self new
		setRowCount: aRowCount;
		setColumnCount: aColumnCount;
		setContents: anArray;
		yourself