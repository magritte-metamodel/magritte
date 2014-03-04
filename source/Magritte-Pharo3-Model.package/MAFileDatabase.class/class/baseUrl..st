accessing
baseUrl: aString
	"Defines the base-URL where the files are served from, when using an external web server. This setting is left to nil by default, causing the files to be served trough the image."

	baseUrl := aString isNil ifFalse: [
		aString last = $/
			ifFalse: [ aString ]
			ifTrue: [ aString copyUpToLast: $/ ] ]