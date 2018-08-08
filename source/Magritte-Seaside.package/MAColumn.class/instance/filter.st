accessing-settings
filter
	^ self propertyAt: #filter ifAbsent: [ self defaultFilter ]