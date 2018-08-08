tests-accessing
testAllOptionsOptional
	self description beOptional; beSorted; options: #( c b a ).
	self assert: self description allOptions = #( nil a b c ).

	self description beOptional; beUnsorted; options: #( c b a ).
	self assert: self description allOptions = #( nil c b a )