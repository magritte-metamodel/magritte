Extension { #name : #GRPackage }

{ #category : #'*Magritte-Pharo7-Model' }
GRPackage class >> magrittePharoModel [
	^ self new
		name: 'Magritte-Pharo-Model';
		addDependency: 'Magritte-Model';
		url: #magritteUrl;
		yourself
]
