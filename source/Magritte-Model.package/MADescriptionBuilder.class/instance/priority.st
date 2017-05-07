accessing
priority
	^ priority ifNil: [ ^self class defaultPriority ]