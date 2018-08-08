accessing-dynamic
shouldNotInclude: anObject
	^ self isExtensible not or: [ super shouldNotInclude: anObject ]