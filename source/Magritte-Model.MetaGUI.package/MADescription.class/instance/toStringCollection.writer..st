strings
toStringCollection: aCollection writer: aFormatter
	"Answer a collection of strings being formatted from ==aCollection== using ==aFormatter==."

	^ aCollection collect: [ :each | self toString: each writer: aFormatter ]