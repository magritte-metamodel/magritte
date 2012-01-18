*magritte-pharo-model
isMorph
	"Answer ==false==, since I am no morph. Squeak is calling this method after image-startup and might lock if I do not answer to this message."

	^ false