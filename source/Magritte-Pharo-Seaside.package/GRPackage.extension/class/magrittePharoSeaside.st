*magritte-pharo-seaside
magrittePharoSeaside
	^ self new
		name: 'Magritte-Pharo-Seaside';
		addDependency: 'Magritte-Seaside';
		addDependency: 'Magritte-Pharo-Model';
		addDependency: 'Seaside-Pharo-Canvas';
		url: #magritteUrl;
		yourself