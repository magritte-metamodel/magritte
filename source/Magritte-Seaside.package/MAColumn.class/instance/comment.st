accessing-settings
comment
	^ self propertyAt: #comment ifAbsent: [ self defaultComment ]