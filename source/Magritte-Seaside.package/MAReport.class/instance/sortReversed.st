accessing-settings
sortReversed
	^ backtracked at: #sortReversed ifAbsent: [ self defaultSortReversed ]