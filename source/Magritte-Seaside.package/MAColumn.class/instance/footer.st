accessing-settings
footer
	^ self propertyAt: #footer ifAbsent: [ self defaultFooter ]