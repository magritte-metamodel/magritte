accessing-settings
rowPeriod
	^ properties at: #rowPeriod ifAbsent: [ self defaultRowPeriod ]