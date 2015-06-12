accessing-messages
kindErrorMessage
	^ self propertyAt: #kindErrorMessage ifAbsent: [ 'Invalid input given' ]