instance creation
rows: aRowCount columns: aColumnCount
	^ self rows: aRowCount columns: aColumnCount contents: (Array new: aRowCount * aColumnCount)