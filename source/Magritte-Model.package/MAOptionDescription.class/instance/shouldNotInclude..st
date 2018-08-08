accessing-dynamic
shouldNotInclude: anObject
	^ self isExtensible not or: [ anObject isNil or: [ self options includes: anObject ] ]