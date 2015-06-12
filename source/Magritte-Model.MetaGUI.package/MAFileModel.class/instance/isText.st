testing-types
isText
	"Return ==true== if the mimetype of the receiver is text-data. This message will match types like: text/plain, text/html, text/sgml, text/css, text/xml, text/richtext, etc."

	^ self maintype = 'text'