testing-types
isApplication
	"Return ==true== if the mimetype of the receiver is application-data. This message will match types like: application/postscript, application/zip, application/pdf, etc."

	^ self maintype = 'application'