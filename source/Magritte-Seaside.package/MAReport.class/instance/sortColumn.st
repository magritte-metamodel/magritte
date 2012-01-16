accessing-settings
sortColumn
	^ backtracked at: #sortColumn ifAbsent: [ self defaultSortColumn ]