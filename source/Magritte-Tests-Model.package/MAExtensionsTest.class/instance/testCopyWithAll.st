tests-collection
testCopyWithAll
	| col res |
	col := #( a b ).
	res := col copyWithAll: #( c d ).
	self assert: res = #( a b c d ).
	self deny: col == res.

	col := Set with: #a with: #b.
	res := col copyWithAll: #( c d ).
	self assert: (res size = 4).
	self assert: (res includes: #a).
	self assert: (res includes: #b).
	self assert: (res includes: #c).
	self assert: (res includes: #d).
	self deny: col == res.

	col := OrderedCollection with: #a with: #b.
	res := col copyWithAll: #( c d ).
	self assert: res = (OrderedCollection with: #a with: #b with: #c with: #d).
	self deny: col == res