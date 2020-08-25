Extension { #name : #GRPackage }

{ #category : #'*magritte-pharo-model' }
GRPackage classSide >> magrittePharoModel [
	^ self new
		name: 'Magritte-Pharo-Model';
		addDependency: 'Magritte-Model';
		url: #magritteUrl;
		yourself
]
