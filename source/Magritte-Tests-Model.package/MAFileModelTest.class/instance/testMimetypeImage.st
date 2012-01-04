tests
testMimetypeImage
	model mimetype: 'image/png'.

	self deny: model isApplication.
	self deny: model isAudio.
	self assert: model isImage.
	self deny: model isText.
	self deny: model isVideo