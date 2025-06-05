Extension { #name : 'MAElementDescription' }

{ #category : '*Magritte-Developer' }
MAElementDescription >> addTo: aClass as: aSymbol [
	| source formattedSource |
	source := String streamContents: [ :s | 
		s
		nextPutAll: aSymbol; nextPutAll: 'Description'; cr;
		nextPutAll: '<magritteDescription>'.
		s 
			nextPutAll: '^ ';
			store: self ].
	formattedSource := (RBParser parseMethod: source) formattedCode.
	aClass compile: formattedSource classified: 'magritte-accessing'.
	self accessor maSetUp: aClass for: self
]
