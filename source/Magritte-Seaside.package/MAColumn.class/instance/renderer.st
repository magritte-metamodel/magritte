accessing-settings
renderer
	^ self propertyAt: #renderer ifAbsent: [ self defaultRenderer ]