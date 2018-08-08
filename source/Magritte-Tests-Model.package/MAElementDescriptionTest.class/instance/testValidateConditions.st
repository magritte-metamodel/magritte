tests-validation
testValidateConditions
	"This test might fail for MADateDescriptionTest, since there is a bug in Squeak."

	| object |
	object := self includedInstance.
	self description
		addCondition: [ :value | object == value ]
		labelled: 'included instance test'.
	self
		shouldnt: [ self description validate: object ]
		raise: MAConditionError.
	self
		should: [ self description validate: self nonIdenticalInstance ]
		raise: MAConditionError