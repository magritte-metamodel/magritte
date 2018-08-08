tests-collection
testCopyWithoutFirst
	| col res |
	col := #( a b a c ).
	res := col copyWithoutFirstOccurrenceOf: #a.
	self assert: res = #( b a c ).
	self deny: col == res.

	col := Set with: #a with: #b with: #c.
	res := col copyWithoutFirstOccurrenceOf: #a.
	self assert: res size = 2.
	self assert: (res includes: #b).
	self assert: (res includes: #c).
	self deny: col == res