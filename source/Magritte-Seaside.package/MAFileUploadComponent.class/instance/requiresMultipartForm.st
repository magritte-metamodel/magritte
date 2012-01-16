testing
requiresMultipartForm
	^ self isReadonly not and: [ self value isNil or: [ self value isEmpty ] ]