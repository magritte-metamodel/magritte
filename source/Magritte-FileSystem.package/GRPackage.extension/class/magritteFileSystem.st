*magritte-filesystem
magritteFileSystem
	^ self new
		name: 'Magritte-FileSystem';
		addDependency: 'Magritte-Files-Model';
		url: #magritteUrl;
		yourself