*magritte-seaside-rendering
renderOn: html
	"Renders a download link of the receiver."

	html anchor
		title: (String streamContents: [ :stream |
			stream nextPutAll: self filename; nextPutAll: ' ('.
			stream nextPutAll: self filesize asFileSize; nextPutAll: ', '.
			stream nextPutAll: self mimetype; nextPut: $) ]);
		url: self url;
		with: self filename