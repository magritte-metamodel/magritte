release
releaseToSqueakSource
	"self releaseToSqueakSource"

	(Smalltalk at: #Gofer) new
		squeaksource: 'MetacelloRepository';
		package: self name asString;
		push