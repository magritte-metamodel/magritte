accessing-magritte
descriptionOperations
	<magritteDescription>
	<gtInspectorPresentationOrder: 1>
	^ MAToManyRelationDescription new
		accessor: #operations;
		glmPresentation: [ :a | a list ];
		classes: { MAPatchOperation };
		yourself