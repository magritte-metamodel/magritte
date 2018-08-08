private
rowStyleForNumber: aNumber
	^ self rowStyles
		at: ((aNumber - 1 // self rowPeriod) \\ self rowStyles size) + 1
		ifAbsent: [ String new ]