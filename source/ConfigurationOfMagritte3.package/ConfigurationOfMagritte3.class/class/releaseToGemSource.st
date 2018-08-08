release
releaseToGemSource
	"self releaseToGemSource"

	(Smalltalk at: #Gofer) new
		gemsource: 'MetacelloRepository';
		package: self name asString;
		push