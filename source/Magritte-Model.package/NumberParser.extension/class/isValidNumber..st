*Magritte-Model
isValidNumber: aStringOrStream
	| stream parser |
	stream := aStringOrStream readStream.
	parser := (Smalltalk at: #ExtendedNumberParser ifAbsent: [self]).
	parser parse: stream onError: [ ^ false ].
	^ stream atEnd