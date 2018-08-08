accessing-dynamic
shouldNotInclude: anObject
	^ anObject isNil or: [ self options includes: anObject ]