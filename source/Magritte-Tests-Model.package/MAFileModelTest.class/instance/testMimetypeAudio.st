tests
testMimetypeAudio
	model mimetype: 'audio/mpeg'.

	self deny: model isApplication.
	self assert: model isAudio.
	self deny: model isImage.
	self deny: model isText.
	self deny: model isVideo