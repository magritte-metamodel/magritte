tests-accessing
testAllOptionsWithExtensible
	self description beRequired; beUnsorted; beLimited; options: #( c d a ).
	self assert: (self description allOptionsWith: #b) = #( c d a ).

	self description beRequired; beUnsorted; beExtensible; options: #( c d a ).
	self assert: (self description allOptionsWith: #b) = #( c d a b ).

	self description beRequired; beSorted; beLimited; options: #( c d a ).
	self assert: (self description allOptionsWith: #b) = #( a c d ).

	self description beRequired; beSorted; beExtensible; options: #( c d a ).
	self assert: (self description allOptionsWith: #b) = #( a b c d )