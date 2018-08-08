*magritte-tests-files-model
magritteTestsFilesModel
	^ self new
		name: 'Magritte-Tests-Files-Model';
		addDependency: 'Magritte-Tests-Model';
		addDependency: 'Magritte-Files-Model';
		url: #magritteUrl;
		yourself