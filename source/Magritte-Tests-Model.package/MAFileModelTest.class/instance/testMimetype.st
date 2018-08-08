tests
testMimetype
	self assert: model mimetype = 'application/octet-stream'.
	self assert: model maintype = 'application'.
	self assert: model subtype = 'octet-stream'.

	model mimetype: 'text/html'.
	self assert: model mimetype = 'text/html'.
	self assert: model maintype = 'text'.
	self assert: model subtype = 'html'