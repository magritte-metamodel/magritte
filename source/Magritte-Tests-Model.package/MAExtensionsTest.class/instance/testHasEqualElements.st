tests-collection
testHasEqualElements
	| one two |
	one := #( 1 2 3 ).

	two := #( 1 2 3 ) asOrderedCollection.
	self assert: (self does: one haveEqualElementsTo: two).
	self assert: (self does: two haveEqualElementsTo: one).
	
	two := #( 1 2 4 ).
	self deny: (self does: one haveEqualElementsTo: two).
	self deny: (self does: two haveEqualElementsTo: one).
	
	two := #( 1 2 3 4 ).
	self deny: (self does: one haveEqualElementsTo: two).
	self deny: (self does: two haveEqualElementsTo: one).
	