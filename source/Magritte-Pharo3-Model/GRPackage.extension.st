Extension { #name : #GRPackage }

{ #category : #'*Magritte-Pharo3-Model' }
GRPackage classSide >> magrittePharoModel [
	^ self new
		name: 'Magritte-Pharo-Model';
		addDependency: 'Magritte-Model';
		url: #magritteUrl;
		yourself
]
