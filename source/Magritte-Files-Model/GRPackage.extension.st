Extension { #name : 'GRPackage' }

{ #category : '*magritte-files-model' }
GRPackage classSide >> magritteFilesModel [
	^ self new
		name: 'Magritte-Files-Model';
		addDependency: 'Magritte-Model';
		url: #magritteUrl;
		yourself
]
