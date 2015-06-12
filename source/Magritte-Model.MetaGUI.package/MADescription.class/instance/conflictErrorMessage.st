accessing-messages
conflictErrorMessage
	^ self propertyAt: #conflictErrorMessage ifAbsent: [ 'Input is conflicting with concurrent modification' ]