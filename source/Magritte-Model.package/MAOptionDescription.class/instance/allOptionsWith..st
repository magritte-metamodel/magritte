accessing-dynamic
allOptionsWith: anObject
	^ self prepareOptions: ((self shouldNotInclude: anObject)
		ifFalse: [ self options copyWith: anObject ]
		ifTrue: [ self options copy ])