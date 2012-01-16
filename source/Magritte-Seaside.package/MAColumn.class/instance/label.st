accessing-settings
label
	^ self propertyAt: #label ifAbsent: [ self defaultLabel ]