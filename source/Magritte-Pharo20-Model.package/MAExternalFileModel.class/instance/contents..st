accessing
contents: aByteArray
	| stream |
	stream := self writeStream.
	[ stream nextPutAll: aByteArray asByteArray ]
		ensure: [ stream close ].
	super contents: aByteArray