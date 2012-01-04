accessing
default
	^ self propertyAt: #default ifAbsent: [ self class defaultDefault ]