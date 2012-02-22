accessing
baseDirectory
	^ baseDirectory ifNil: [ FileDirectory default directoryNamed: 'files' ]