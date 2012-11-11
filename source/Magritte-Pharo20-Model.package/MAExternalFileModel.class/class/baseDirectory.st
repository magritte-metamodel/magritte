accessing
baseDirectory
	^ baseDirectory ifNil: [ FileSystem disk workingDirectory / 'files' ]