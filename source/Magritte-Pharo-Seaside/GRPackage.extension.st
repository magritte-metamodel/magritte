Extension { #name : #GRPackage }

{ #category : #'*magritte-pharo-seaside' }
GRPackage class >> magrittePharoSeaside [
	^ self new
		name: 'Magritte-Pharo-Seaside';
		addDependency: 'Magritte-Seaside';
		addDependency: 'Magritte-Pharo-Model';
		addDependency: 'Seaside-Pharo-Canvas';
		url: #magritteUrl;
		yourself
]
