accessing-defaults
defaultSorter
	^ (self magritteDescription isSortable and: [ self magritteDescription isRequired ])
		ifTrue: [ super defaultSorter ]