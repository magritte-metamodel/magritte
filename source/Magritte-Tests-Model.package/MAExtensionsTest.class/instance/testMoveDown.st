tests-collection
testMoveDown
	| col |
	col := Array with: 1 with: 2 with: 3.

	self assert: (col moveDown: 1) = 2.
	self assert: col = #( 2 1 3 ).

	self assert: (col moveDown: 1) = 3.
	self assert: col = #( 2 3 1 ).

	self assert: (col moveDown: 1) = 3.
	self assert: col = #( 2 3 1 ).

	self assert: (col moveDown: 0) = 0.
	self assert: col = #( 2 3 1 )