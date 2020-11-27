accessing-properties
display: aBlockOrSymbol
	"Transform how the file is converted to a string.
	aSymbol
		- is performed on the object
	aBlock
		- takes one argument, which is the domain object
		- returns the string to display
	
	NB. This string may be used to convert back to a domain object, so make sure it is suitable via the string reader in use."
	self propertyAt: #displayBlockOrSymbol put: aBlockOrSymbol.