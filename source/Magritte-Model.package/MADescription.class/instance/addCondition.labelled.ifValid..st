validation
addCondition: aCondition labelled: aStringOrBlock ifValid: aDescription

	self
		addCondition: [ :obj | (aDescription isSatisfiedBy: obj) not or: aCondition ] 
		labelled: aStringOrBlock