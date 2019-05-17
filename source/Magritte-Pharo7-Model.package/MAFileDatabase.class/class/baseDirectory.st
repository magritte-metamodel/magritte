accessing
baseDirectory
	^ baseDirectory ifNil: [ FileLocator imageDirectory / 'files' ].