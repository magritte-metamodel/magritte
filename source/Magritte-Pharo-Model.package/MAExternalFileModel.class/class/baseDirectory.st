accessing
baseDirectory
	^ baseDirectory ifNil: [ (FileSystem disk resolveString: 'files') asFileReference ]