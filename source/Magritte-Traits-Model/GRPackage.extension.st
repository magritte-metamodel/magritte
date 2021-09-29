Extension { #name : #GRPackage }

{ #category : #'*magritte-traits-model' }
GRPackage class >> magritteTraitsModel [
	^ self new
		name: 'Magritte-Traits-Model';
		addDependency: 'Magritte-Model';
		url: #magritteUrl;
		yourself
]
