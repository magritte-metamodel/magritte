tests-accessing
testAllOptionsWithNil
	self description beRequired; options: #( a b c ).
	self assert: (self description allOptionsWith: nil) = #( a b c )