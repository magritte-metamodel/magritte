tests-validation
testValidateMultipleFailures
	"This test might fail for MADateDescriptionTest, since there is a bug in Squeak."

	| object |
	object := self includedInstance.
	self description
		addCondition: [ :value | false ] labelled: 'Condition 1';
		addCondition: [ :value | false ] labelled: 'Condition 2'.
	self
		should: [ self description validate: object ]
		raise: MAMultipleErrors
		withExceptionDo: [ :e | self assert: e collection size equals: 2 ]