accessing-properties
display: aBlockOrSymbol
	"Transform how the file is converted to a string.
	aSymbol
		- is performed on the object
	aBlock
		- takes one argument, which is the domain object
		- returns the string to display"
	self propertyAt: #displayBlockOrSymbol put: aBlockOrSymbol.