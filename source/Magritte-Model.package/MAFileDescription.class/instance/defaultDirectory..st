accessing
defaultDirectory: fileReference
	"fileReference - a FileSystem FileReference, or an MAFileReference if FileSystem is not installed"

	self propertyAt: #defaultDirectory put: fileReference