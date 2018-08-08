tests
testMimetypeVideo
	model mimetype: 'video/mpeg'.
	
	self deny: model isApplication.
	self deny: model isAudio.
	self deny: model isImage.
	self deny: model isText.
	self assert: model isVideo