*Magritte-Developer
addTo: aClass as: aSymbol
	| source formattedSource |
	source := String streamContents: [ :s | 
		s
		nextPutAll: 'description', aSymbol capitalized; cr;
		nextPutAll: '<magritteDescription>'.
		s 
			nextPutAll: '^ ';
			store: self ].
	formattedSource := (RBParser parseMethod: source) formattedCode.
	aClass compile: formattedSource classified: 'accessing-magritte'.
	self accessor maSetUp: aClass