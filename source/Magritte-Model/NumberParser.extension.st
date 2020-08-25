Extension { #name : #NumberParser }

{ #category : #'*Magritte-Model' }
NumberParser class >> isNumber: aStringOrStream [

	| stream |
	stream := aStringOrStream readStream.
	NumberParser parse: stream onError: [ ^ false ].
	^ stream atEnd
]
