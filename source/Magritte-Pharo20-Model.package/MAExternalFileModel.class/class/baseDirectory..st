accessing
baseDirectory: aStringOrDirectory
	"Defines the base-directory where the files are stored. If this value is set to nil, it default to a subdirectory of of the current image-location."

	baseDirectory := aStringOrDirectory isString
		ifTrue: [ FileDirectory on: aStringOrDirectory ]
		ifFalse: [ aStringOrDirectory ]