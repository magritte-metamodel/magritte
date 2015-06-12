accessing-messages
multipleErrorsMessage
	^ self propertyAt: #multipleErrorsMessage ifAbsent: [ 'Multiple errors' ]