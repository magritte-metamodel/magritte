evaluating
value: aFirstObject value: aSecondObject
	^ (accessor read: aFirstObject)
		perform: selector
		with: (accessor read: aSecondObject)