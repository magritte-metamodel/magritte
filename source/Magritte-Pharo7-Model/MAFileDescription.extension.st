Extension { #name : #MAFileDescription }

{ #category : #'*Magritte-Pharo7-Model' }
MAFileDescription >> defaultDirectory [

	^ self propertyAt: #defaultDirectory ifAbsent: [ MAFileSystem imageDirectory ].
]

{ #category : #'*Magritte-Pharo7-Model' }
MAFileDescription >> defaultDirectory: fileReference [
	"fileReference - a FileSystem FileReference, or an MAFileReference if FileSystem is not installed"

	self propertyAt: #defaultDirectory put: fileReference
]
