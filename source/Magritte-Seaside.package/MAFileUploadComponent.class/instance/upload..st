actions
upload: aFile 
	self value: (aFile isNil ifFalse: [ 
		self magritteDescription  kind new
			filename: aFile fileName;
			mimetype: aFile contentType greaseString;
			contents: aFile rawContents;
			yourself ])