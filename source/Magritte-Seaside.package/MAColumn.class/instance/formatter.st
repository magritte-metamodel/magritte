accessing-settings
formatter
	^ self propertyAt: #formatter ifAbsent: [ self defaultFormatter ]