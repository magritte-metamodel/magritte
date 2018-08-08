accessing-calculated
age
	^ self birthday notNil
		ifTrue: [ Date current year - self birthday year ]