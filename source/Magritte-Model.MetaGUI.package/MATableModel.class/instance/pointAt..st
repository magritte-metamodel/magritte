private
pointAt: anIndex
	^ Point x: (anIndex - 1 // self columnCount + 1) y: (anIndex - 1 \\ self columnCount + 1)