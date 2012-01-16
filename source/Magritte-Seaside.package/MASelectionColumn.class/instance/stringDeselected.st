accessing-settings
stringDeselected
	^ self propertyAt: #stringDeselected ifAbsent: [ self defaultStringDeselected ]