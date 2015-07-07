private
nextMatchAll: aCollection on: aStream
	"Tries to match ==aCollection== on ==aStream==. Answer ==true== if ==aCollection== was consumed, otherwise ==false==."

	| position |
	(aCollection isNil or: [ aCollection isEmpty ])
		ifTrue: [ ^ false ].
	position := aStream position.
	aCollection do: [ :char |
		(aStream atEnd or: [ aStream next ~= char ]) ifTrue: [
			aStream position: position.
			^ false ] ].
	^ true