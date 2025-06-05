Extension { #name : 'GRPackage' }

{ #category : '*magritte-traits-model' }
GRPackage classSide >> magritteTraitsModel [
	^ self new
		name: 'Magritte-Traits-Model';
		addDependency: 'Magritte-Model';
		url: #magritteUrl;
		yourself
]
