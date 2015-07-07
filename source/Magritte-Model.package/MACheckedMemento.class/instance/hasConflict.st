testing
hasConflict
	"Answer ==true==, if there is an edit conflict."

	^ self hasChanged and: [ self isDifferent: self original to: self pullRaw ]