tests-accessing
testKind
	self assert: MAToOneRelationDescription new kind equals: Object.
	self assert: (MAToOneRelationDescription new
		classes: (Array with: MAToOneRelationDescriptionTest);
		yourself) kind equals: MAToOneRelationDescriptionTest.
	self assert: (MAToOneRelationDescription new
		classes: (Array with: MAToOneRelationDescriptionTest with: MAToManyRelationDescriptionTest);
		yourself) kind equals: MARelationDescriptionTest.