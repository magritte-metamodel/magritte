accessing-dynamic
writeStream
	^ ((self directory / self filename) deleteIfAbsent: [])
		writeStream binary; yourself