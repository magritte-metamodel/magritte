reflection
withAllConcreteClassesDo: aBlock
	self withAllSubclassesDo: [ :each |
		each isAbstract ifFalse: [
			aBlock value: each ] ]