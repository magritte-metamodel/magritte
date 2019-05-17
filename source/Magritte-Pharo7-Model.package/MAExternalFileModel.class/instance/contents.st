accessing
contents
	| stream |
	^ self file exists
		ifFalse: [ ByteArray new ]
		ifTrue: [
			stream := self readStream.
			[ stream contents ]
				ensure: [ stream close ] ]