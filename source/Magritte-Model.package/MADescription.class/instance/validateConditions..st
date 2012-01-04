validation-private
validateConditions: anObject
	"Validate ==anObject== to satisfy all its custom conditions."

	self conditions do: [ :each |
		(each key value: anObject)
			ifFalse: [ MAConditionError description: self signal: each value ] ]