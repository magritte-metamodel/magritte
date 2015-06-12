*Magritte-Model
isNumber: aStringOrStream

	| stream |
	stream := aStringOrStream readStream.
	NumberParser parse: stream onError: [ ^ false ].
	^ stream atEnd