tests-accessing
testAllOptions
	self description beRequired; beSorted; options: #( c b a ).
	self assert: self description allOptions = #( a b c ).

	self description beRequired; beUnsorted; options: #( c b a ).
	self assert: self description allOptions = #( c b a )