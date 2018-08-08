testing
hasChanged
	"Answer ==true==, if the cached data is different to the data in the model."

	^ self isDifferent: self cache to: self pullRaw