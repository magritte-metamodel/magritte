Extension { #name : #GRPackage }

{ #category : #'*magritte-seaside' }
GRPackage class >> magritteSeaside [
	^ self new
		name: 'Magritte-Seaside';
		description: 'Seaside integration for the Magritte metamodel.';
		addDependency: 'Magritte-Model';
		addDependency: 'Seaside-Component';
		addDependency: 'Seaside-Canvas';
		"MADescriptionEditor registers itself as an example application"
		addDependency: 'Seaside-Tools-Core';
		url: #magritteUrl;
		yourself
]
