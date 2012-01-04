tests-accessing
testAllOptionsWithExisting
	self description beRequired; options: #( a b c ).
	self assert: (self description allOptionsWith: #a) = #( a b c )