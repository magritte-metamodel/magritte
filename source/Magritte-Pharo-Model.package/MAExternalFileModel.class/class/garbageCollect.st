public
garbageCollect
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