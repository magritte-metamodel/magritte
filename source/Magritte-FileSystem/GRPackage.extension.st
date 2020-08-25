Extension { #name : #GRPackage }

{ #category : #'*magritte-filesystem' }
GRPackage classSide >> magritteFileSystem [
	^ self new
		name: 'Magritte-FileSystem';
		addDependency: 'Magritte-Files-Model';
		url: #magritteUrl;
		yourself
]
