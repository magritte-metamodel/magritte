accessing
baseDirectory: aStringOrDirectory
	"Defines where the files are stored. If this value is set to nil, it defaults to a subdirectory of of the current image-location."

	baseDirectory := aStringOrDirectory asFileReference.