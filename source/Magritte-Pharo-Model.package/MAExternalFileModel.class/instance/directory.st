accessing-dynamic
directory
	^ self location
		inject: self baseDirectory
		into: [ :result :each | result directoryNamed: each ]