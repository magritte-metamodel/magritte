tests-collection
testMoveUp
	| col |
	col := Array with: 1 with: 2 with: 3.

	self assert: (col moveUp: 3) = 2.
	self assert: col = #( 1 3 2 ).

	self assert: (col moveUp: 3) = 1.
	self assert: col = #( 3 1 2 ).

	self assert: (col moveUp: 3) = 1.
	self assert: col = #( 3 1 2 ).

	self assert: (col moveUp: 0) = 0.
	self assert: col = #( 3 1 2 )