accessing-dynamic
allClasses
	^ (Array withAll: self classes)
		sort: [ :a :b | a label caseInsensitiveLessOrEqual: b label ];
		yourself