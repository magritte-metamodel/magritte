testing-types
isAudio
	"Return ==true== if the mimetype of the receiver is audio-data. This message will match types like: audio/basic, audio/tone, audio/mpeg, etc."

	^ self maintype = 'audio'