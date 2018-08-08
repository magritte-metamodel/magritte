accessing-settings
rowFilter
	^ backtracked at: #rowFilter ifAbsent: [ self defaultRowFilter ]