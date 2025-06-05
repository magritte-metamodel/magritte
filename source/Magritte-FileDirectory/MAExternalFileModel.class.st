"
I manage the file-data I represent on the file-system. From the programmer this looks the same as if the file would be in memory (==*MAMemoryFileModel*==), as it is transparently loaded and written out as necessary.

- The ==#baseDirectory== is the place where Magritte puts its file-database. Keep this value to nil to make it default to a subdirectory next to the Squeak image.
- The ==#baseUrl== is a nice optimization to allow Apache (or any other Web Server) to directly serve the files. ==#baseUrl== is an absolute URL-prefix that is used to generate the path to the file. If you have specified one the file data does not go trough the image anymore, but instead is directly served trough the properly configured Web Server.

The files are currently stored using the following scheme:

=/files/9d/bsy8kyp45g0q7blphknk48zujap2wd/earthmap1k.jpg
=1     2   3                              4

#Is the #baseDirectory as specified in the settings.
#Are 256 directories named '00' to 'ff' to avoid having thousands of files in the same directory. Unfortunately this leads to problems with the Squeak file primitives and some filesystems don't handle that well. This part is generated at random.
#This is a secure id, similar to the Seaside session key. It is generated at random and provides a security system that even works trough Apache (you have to disable directory listings of course): if you don't know the file-name you cannot access the file.
#This is the original file-name. Subclasses might want to store other cached versions of the same file there, for example resized images, etc.
"
Class {
	#name : 'MAExternalFileModel',
	#superclass : 'MAFileModel',
	#instVars : [
		'location'
	],
	#classInstVars : [
		'baseDirectory',
		'baseUrl'
	],
	#category : 'Magritte-FileDirectory'
}

{ #category : 'accessing' }
MAExternalFileModel class >> baseDirectory [
	^ baseDirectory ifNil: [ FileDirectory default directoryNamed: 'files' ]
]

{ #category : 'accessing' }
MAExternalFileModel class >> baseDirectory: aStringOrDirectory [
	"Defines the base-directory where the files are stored. If this value is set to nil, it default to a subdirectory of of the current image-location."

	baseDirectory := aStringOrDirectory isString
		ifTrue: [ FileDirectory on: aStringOrDirectory ]
		ifFalse: [ aStringOrDirectory ]
]

{ #category : 'accessing' }
MAExternalFileModel class >> baseDirectoryPath [
	^ self baseDirectory pathName
]

{ #category : 'accessing' }
MAExternalFileModel class >> baseDirectoryPath: aString [
	self baseDirectory: (FileDirectory on: aString)
]

{ #category : 'accessing' }
MAExternalFileModel class >> baseUrl [
	^ baseUrl
]

{ #category : 'accessing' }
MAExternalFileModel class >> baseUrl: aString [
	"Defines the base-URL where the files are served from, when using an external web server. This setting is left to nil by default, causing the files to be served trough the image."

	baseUrl := aString isNil ifFalse: [
		aString last = $/
			ifFalse: [ aString ]
			ifTrue: [ aString copyUpToLast: $/ ] ]
]

{ #category : 'public' }
MAExternalFileModel class >> garbageCollect [
	"Remove obsolete files from the file-system that do not have a counterpart in memory anymore. This method has to be called manually and is not intended to be portable."
	
	| mark sweep |
	mark := self allInstances
		collect: [ :each | each directory pathName ].
	sweep := Array with: self baseDirectory.
	self locationDefinition do: [ :definition |
		sweep := sweep gather: [ :directory |
			directory entries isEmpty
				ifTrue: [ directory recursiveDelete ].
			(directory directoryNames
				select: [ :each | each size = definition first ])
				collect: [ :each | directory directoryNamed: each ] ] ].
	sweep do: [ :directory |
		(mark includes: directory pathName)
			ifFalse: [ directory recursiveDelete ] ]
]

{ #category : 'initialization' }
MAExternalFileModel class >> initialize [
	baseDirectory := baseUrl := nil
]

{ #category : 'initialization' }
MAExternalFileModel class >> locationDefinition [
	^ #( ( 2 '63450af8d9c2e17b' ) ( 30 'iaojv41bw67e0tud5m9rgplqfy8x3cs2kznh' ) )
]

{ #category : 'comparing' }
MAExternalFileModel >> = anObject [
    ^ super = anObject and: [ self location = anObject location ]
]

{ #category : 'configuration' }
MAExternalFileModel >> baseDirectory [
	^ self class baseDirectory
]

{ #category : 'configuration' }
MAExternalFileModel >> baseUrl [
	^ self class baseUrl
]

{ #category : 'accessing' }
MAExternalFileModel >> contents [
	| stream |
	^ (self directory exists and: [ self directory fileExists: self filename ])
		ifFalse: [ ByteArray new ]
		ifTrue: [
			stream := self readStream.
			[ stream contents ]
				ensure: [ stream close ] ]
]

{ #category : 'accessing' }
MAExternalFileModel >> contents: aByteArray [
	| stream |
	stream := self writeStream.
	[ stream nextPutAll: aByteArray asByteArray ]
		ensure: [ stream close ].
	super contents: aByteArray
]

{ #category : 'accessing-dynamic' }
MAExternalFileModel >> directory [
	^ self location
		inject: self baseDirectory
		into: [ :result :each | result directoryNamed: each ]
]

{ #category : 'initialization' }
MAExternalFileModel >> finalize [
	| directory |
	directory := self directory.
	directory exists
		ifTrue: [ directory recursiveDelete ].
	[ (directory := directory containingDirectory) entries isEmpty ]
		whileTrue: [ directory recursiveDelete ].
	super finalize.
	location := nil
]

{ #category : 'comparing' }
MAExternalFileModel >> hash [
	^ super hash bitXor: self location hash
]

{ #category : 'accessing-dynamic' }
MAExternalFileModel >> location [
	^ location ifNil: [ location := self uniqueLocation: self locationDefinition ]
]

{ #category : 'configuration' }
MAExternalFileModel >> locationDefinition [
	^ self class locationDefinition
]

{ #category : 'copying' }
MAExternalFileModel >> postCopy [
	| previous |
	super postCopy.
	previous := self contents.
	location := nil.
	self contents: previous
]

{ #category : 'accessing-dynamic' }
MAExternalFileModel >> readStream [
	^ (self directory readOnlyFileNamed: self filename) binary
]

{ #category : 'private' }
MAExternalFileModel >> uniqueLocation: aLocationDefinition [
	"Finds an unique path to be used and create the necessary sub directories."

	| valid result directory definition |
	valid := false.
	result := Array new: aLocationDefinition size.
	[ valid ] whileFalse: [
		directory := self baseDirectory assureExistence.
		result keysAndValuesDo: [ :index :value |
			definition := aLocationDefinition at: index.
			result at: index put: ((String new: definition first)
				collect: [ :each | definition second atRandom ]).
			directory := directory
				directoryNamed: (result at: index).
			directory exists ifFalse: [
				directory assureExistence.
				valid := true ] ] ].
	^ result
]

{ #category : 'accessing-dynamic' }
MAExternalFileModel >> writeStream [
	^ (self directory forceNewFileNamed: self filename) binary
]
