Extension { #name : #GRPackage }

{ #category : #'*magritte-tests-pharo-model' }
GRPackage class >> magritteTestsPharoModel [
	^ self new
		name: 'Magritte-Tests-Pharo-Model';
		addDependency: 'Magritte-Pharo-Model';
		url: #magritteUrl;
		yourself
]
