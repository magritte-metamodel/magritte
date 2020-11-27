Extension { #name : #GRPackage }

{ #category : #'*magritte-filesystem' }
GRPackage class >> magritteFileSystem [
	^ self new
		name: 'Magritte-FileSystem';
		addDependency: 'Magritte-Files-Model';
		url: #magritteUrl;
		yourself
]
