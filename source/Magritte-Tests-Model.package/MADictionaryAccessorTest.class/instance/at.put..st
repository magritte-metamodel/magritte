accessing
at: aKey put: aValue
	self assert: aKey = #value.
	^ value := aValue