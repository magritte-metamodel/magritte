public
uniqueLocation
	"Finds an unique path to be used and create the necessary sub directories."

	| partition id result |
	[
		partition := self randomPartitionFolderName.
		id := self randomIdentifierName.
		result := self baseDirectory ensureDirectory / partition / id.
	] doWhileTrue: [ result exists ].
	
	^ result ensureDirectory.