accessing-properties
display: aBlockOrSymbol
	"Transform how the file is converted to a string.
	aSymbol
		- is performed on the object
	aBlock
		- takes one argument, which is the file object
		- returns the string to display"
	aBlockOrSymbol isSymbol
		ifTrue: [ self propertyAt: #displayBlock put: [ :e | e perform: aBlockOrSymbol ] ]
		ifFalse: [ self propertyAt: #displayBlock put: aBlockOrSymbol ]