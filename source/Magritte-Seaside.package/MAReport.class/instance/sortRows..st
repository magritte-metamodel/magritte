private
sortRows: aCollection
	^ self isSorted
		ifFalse: [ aCollection ]
		ifTrue: [ self sortColumn sortRows: aCollection ]