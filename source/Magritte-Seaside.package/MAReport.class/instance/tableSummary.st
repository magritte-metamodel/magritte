accessing-settings
tableSummary
	^ properties at: #tableSummary ifAbsent: [ self defaultTableSummary ]