private-building
stringDecoder
	"Test whether a string represents an object"
	^ stringDecoder ifNil: [ stringDecoder := [ :obj :str | obj asString = str ] ]