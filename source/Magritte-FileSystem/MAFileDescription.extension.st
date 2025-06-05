Extension { #name : 'MAFileDescription' }

{ #category : '*Magritte-FileSystem' }
MAFileDescription >> defaultDirectory [

	^ self propertyAt: #defaultDirectory ifAbsent: [ MAFileSystem imageDirectory ].
]

{ #category : '*Magritte-FileSystem' }
MAFileDescription >> defaultDirectory: fileReference [
	"fileReference - a FileSystem FileReference, or an MAFileReference if FileSystem is not installed"

	self propertyAt: #defaultDirectory put: fileReference
]
