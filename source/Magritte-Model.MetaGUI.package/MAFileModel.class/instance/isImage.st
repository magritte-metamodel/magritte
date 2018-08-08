testing-types
isImage
	"Return ==true== if the mimetype of the receiver is image-data. This message will match types like: image/jpeg, image/gif, image/png, image/tiff, etc."

	^ self maintype = 'image'