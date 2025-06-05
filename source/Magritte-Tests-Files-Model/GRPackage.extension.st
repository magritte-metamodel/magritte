Extension { #name : 'GRPackage' }

{ #category : '*magritte-tests-files-model' }
GRPackage classSide >> magritteTestsFilesModel [
	^ self new
		name: 'Magritte-Tests-Files-Model';
		addDependency: 'Magritte-Tests-Model';
		addDependency: 'Magritte-Files-Model';
		url: #magritteUrl;
		yourself
]
