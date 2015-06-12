testing-types
isVideo
	"Return ==true== if the mimetype of the receiver is video-data. This message will match types like: video/mpeg, video/quicktime, etc."

	^ self maintype = 'video'