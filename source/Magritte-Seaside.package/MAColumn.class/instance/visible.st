accessing-settings
visible
	^ self propertyAt: #visible ifAbsent: [ self defaultVisible ]