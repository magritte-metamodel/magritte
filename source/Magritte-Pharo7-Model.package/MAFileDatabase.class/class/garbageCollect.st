public
garbageCollect
	"Remove obsolete files from the file-system that are not referenced from the image anymore. This method has to be called manually and is not intended to be portable."
	
	| mark sweep |
	mark := self allInstances
		collect: [ :each | each directory ].
	sweep := Array with: self baseDirectory.
	self locationDefinition do: [ :definition |
		sweep := sweep gather: [ :directory |
			directory hasChildren ifFalse: [ directory delete ].
			FileLocator imageDirectory directories select: [ :e | e basename size = definition first ] ] ].
	sweep do: [ :directory |
		(mark includes: directory) ifFalse: [ directory recursiveDelete ] ]