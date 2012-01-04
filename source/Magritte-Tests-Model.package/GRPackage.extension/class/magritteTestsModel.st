*magritte-tests-model
magritteTestsModel
	^ self new
		name: 'Magritte-Tests-Model';
		description: 'Unit tests for the Magritte metamodel.';
		addDependency: 'Magritte-Model';
		url: #magritteUrl;
		yourself