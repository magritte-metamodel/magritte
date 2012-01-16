accessing-defaults
defaultSorter
	^ (self description isSortable and: [ self description isRequired ])
		ifTrue: [ super defaultSorter ]