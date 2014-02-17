testing
testKind
	self assert: MAToManyRelationDescription new kind equals: Collection.
	self assert: (MAToManyRelationDescription new
		ordered: true;
		yourself) kind equals: OrderedCollection.
	self assert: (MAToManyRelationDescription new
		sorted: true;
		yourself) kind equals: SortedCollection.