accessing-dynamic
readStream
	^ (self directory / self filename) readStream binary; yourself