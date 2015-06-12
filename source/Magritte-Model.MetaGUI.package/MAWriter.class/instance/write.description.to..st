visiting
write: anObject description: aDescription to: aStream
	self
		object: anObject;
		stream: aStream;
		visit: aDescription.
	^ self contents