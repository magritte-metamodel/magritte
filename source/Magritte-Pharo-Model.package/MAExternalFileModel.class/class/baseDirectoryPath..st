accessing
baseDirectoryPath: aString
	self baseDirectory: (FileSystem disk resolveString: aString) asFileReference