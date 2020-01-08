accessing-properties
shouldCacheDefault

	^ self propertyAt: #shouldCacheDefault ifAbsent: [ self class defaultShouldCacheDefault ]