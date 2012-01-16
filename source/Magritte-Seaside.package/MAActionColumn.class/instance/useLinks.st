accessing
useLinks
	^ self propertyAt: #useLinks ifAbsent: [ self defaultUseLinks ]