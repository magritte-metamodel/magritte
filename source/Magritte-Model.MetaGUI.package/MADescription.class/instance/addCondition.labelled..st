validation
addCondition: aCondition labelled: aString
	"Add ==aCondition== as an additional validation condition to the receiver and give it the label ==aString==. The first argument is either a block-context or any other object that responds to ==#value:== with ==true== or ==false==."

	self conditions: (self conditions
		copyWith: (Association
			key: aCondition
			value: aString))