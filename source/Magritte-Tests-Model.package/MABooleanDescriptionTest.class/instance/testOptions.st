tests
testOptions
	self assert: (self description options) = #(false true).
	self assert: (self description allOptionsWith: Object new) = #(false true)