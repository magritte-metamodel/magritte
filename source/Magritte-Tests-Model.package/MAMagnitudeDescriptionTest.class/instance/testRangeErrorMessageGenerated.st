tests-validation
testRangeErrorMessageGenerated
	self description min: nil max: nil.
	self assert: self description rangeErrorMessage isNil.
	
	self description min: nil max: self maxInstance.
	self assert: self description rangeErrorMessage notEmpty.
	
	self description min: self minInstance max: nil.
	self assert: self description rangeErrorMessage notEmpty.

	self description min: self minInstance max: self maxInstance.
	self assert: self description rangeErrorMessage notEmpty