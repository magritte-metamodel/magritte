accessing-settings
stringSelected
	^ self propertyAt: #stringSelected ifAbsent: [ self defaultStringSelected ]