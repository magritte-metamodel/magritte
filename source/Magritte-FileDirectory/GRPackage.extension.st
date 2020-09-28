Extension { #name : #GRPackage }

{ #category : #'*magritte-filedirectory' }
GRPackage class >> magritteFileDirectory [
	^ self new
		name: 'Magritte-FileDirectory';
		addDependency: 'Magritte-Files-Model';
		url: #magritteUrl;
		yourself
]
