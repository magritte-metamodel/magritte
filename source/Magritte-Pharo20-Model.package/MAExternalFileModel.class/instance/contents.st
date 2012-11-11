accessing
contents
	| stream |
	^ (self directory exists and: [ (self directory / self filename) exists ])
		ifFalse: [ ByteArray new ]
		ifTrue: [
			stream := self readStream.
			[ stream contents ]
				ensure: [ stream close ] ]