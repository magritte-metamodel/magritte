tests-accessing
testAllOptionsWithOptional
	self description beOptional; beSorted; beExtensible; options: #( c d a ).
	self assert: (self description allOptionsWith: #b) = #( nil a b c d ).

	self description beOptional; beSorted; beLimited; options: #( c d a ).
	self assert: (self description allOptionsWith: #b) = #( nil a c d ).

	self description beOptional; beUnsorted; beExtensible; options: #( c d a ).
	self assert: (self description allOptionsWith: #b) = #( nil c d a b ).

	self description beOptional; beUnsorted; beLimited; options: #( c d a ).
	self assert: (self description allOptionsWith: #b) = #( nil c d a )