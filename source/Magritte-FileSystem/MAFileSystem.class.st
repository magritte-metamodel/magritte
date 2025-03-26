Class {
	#name : #MAFileSystem,
	#superclass : #Object,
	#category : 'Magritte-FileSystem'
}

{ #category : #paths }
MAFileSystem class >> extensionFor: aString [ 

	^ aString asFileReference extension.
]

{ #category : #entries }
MAFileSystem class >> fileSizeFor: filenameString [ 
	^ filenameString asFileReference size
]

{ #category : #paths }
MAFileSystem class >> fullNameFor: aString [ 

	^ aString asFileReference fullName.
]

{ #category : #locations }
MAFileSystem class >> imageDirectory [

	^ FileLocator imageDirectory.
]
