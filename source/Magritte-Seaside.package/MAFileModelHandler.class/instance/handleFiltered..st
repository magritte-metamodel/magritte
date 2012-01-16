processing
handleFiltered: aRequestContext
	| response mimeType |
	response := aRequestContext response.
	mimeType := self model mimetype seasideMimeType.
	response
		binary;
		cacheForever;
		contentType: mimeType;
		headerAt: 'Content-Disposition' put: 'inline; filename="' , self model filename , '"'.
	response
		nextPutAll: self model contents;
		respond