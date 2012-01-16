accessing
ajaxId: aSymbol
	^ String streamContents: [ :stream |
		stream
			nextPutAll: 'ajax';
			nextPutAll: self class name;
			print: self hash;
			nextPutAll: aSymbol ]