accessing
contents
	| stream |
	^ (self directory exists and: [ self directory fileExists: self filename ])
		ifFalse: [ ByteArray new ]
		ifTrue: [
			stream := self readStream.
			[ stream contents ]
				ensure: [ stream close ] ]