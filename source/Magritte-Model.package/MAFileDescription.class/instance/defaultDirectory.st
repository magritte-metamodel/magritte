accessing
defaultDirectory

	^ self propertyAt: #defaultDirectory ifAbsent: [ MAFileSystem imageDirectory ].