accessing-settings
rowStyles
	^ properties at: #rowStyles ifAbsent: [ self defaultRowStyles ]