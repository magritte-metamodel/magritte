tests-collection
testIntersection
	| group |
	group := #( 1 2 3 ).
	
	self assert: (self does: (group intersection: group) haveEqualElementsTo: group).
	self assert: (self does: (group intersection: #( )) haveEqualElementsTo: #( )).
	self assert: (self does: (group intersection: #( 4 5 )) haveEqualElementsTo: #( )).
	self assert: (self does: (group intersection: #( 1 3 4 5 )) haveEqualElementsTo: #( 1 3 )).
	self assert: (self does: (group intersection: #( 2 )) haveEqualElementsTo: #( 2 ))