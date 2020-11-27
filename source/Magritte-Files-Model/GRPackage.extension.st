Extension { #name : #GRPackage }

{ #category : #'*magritte-files-model' }
GRPackage class >> magritteFilesModel [
	^ self new
		name: 'Magritte-Files-Model';
		addDependency: 'Magritte-Model';
		url: #magritteUrl;
		yourself
]
