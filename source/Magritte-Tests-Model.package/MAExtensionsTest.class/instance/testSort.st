tests-collection
testSort
	| array |
	array := Array with: 2 with: 3 with: 1.

	array sort: [ :a :b | a < b ].
	self assert: (self does: array haveEqualElementsTo: #( 1 2 3 )).

	array sort: [ :a :b | a > b ].
	self assert: (self does: array haveEqualElementsTo: #( 3 2 1 )).