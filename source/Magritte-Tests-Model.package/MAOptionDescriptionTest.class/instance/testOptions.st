tests-accessing
testOptions
	self description options: #( a b c ).
	self assert: self description options = #( a b c )