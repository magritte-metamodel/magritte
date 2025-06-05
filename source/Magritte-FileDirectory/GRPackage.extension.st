Extension { #name : 'GRPackage' }

{ #category : '*magritte-filedirectory' }
GRPackage classSide >> magritteFileDirectory [
	^ self new
		name: 'Magritte-FileDirectory';
		addDependency: 'Magritte-Files-Model';
		url: #magritteUrl;
		yourself
]
