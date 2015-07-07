strings
toStringCollection: aCollection
	"Answer a collection of strings being formatted from ==aCollection==."

	^ self toStringCollection: aCollection writer: self stringWriter