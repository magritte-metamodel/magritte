Extension { #name : #GRPackage }

{ #category : #'*magritte-tests-files-model' }
GRPackage class >> magritteTestsFilesModel [
	^ self new
		name: 'Magritte-Tests-Files-Model';
		addDependency: 'Magritte-Tests-Model';
		addDependency: 'Magritte-Files-Model';
		url: #magritteUrl;
		yourself
]
