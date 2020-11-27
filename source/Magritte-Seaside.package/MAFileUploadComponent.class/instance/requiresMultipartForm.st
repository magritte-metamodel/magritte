testing
requiresMultipartForm
	^ self isReadOnly not and: [ self value isNil or: [ self value isEmpty ] ]