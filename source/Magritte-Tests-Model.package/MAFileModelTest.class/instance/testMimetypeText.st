tests
testMimetypeText
	model mimetype: 'text/xml'.

	self deny: model isApplication.
	self deny: model isAudio.
	self deny: model isImage.
	self assert: model isText.
	self deny: model isVideo