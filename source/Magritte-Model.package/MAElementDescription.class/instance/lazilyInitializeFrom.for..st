lazy initialization
lazilyInitializeFrom: currentValue for: anObject
	"- The default value is cached if the description's #shouldCacheDefault property is true. An example when caching is necessary is for to-many relations because the user may modify the collection, which will then be thrown away if not cached

	Usage: 
		MyDomainObject>>#getter
			^ self maLazyPropertyUsing: self descriptionName
		
		MyDomainObject>>#descriptionName
			^ MAStringDescription new
					accessor: #name;
					default: 'Alan';
					yourself"
	
	| defaultValue |		
	currentValue ifNotNil: [ ^ currentValue ].
	defaultValue := self default.
	self shouldCacheDefault ifTrue: [ anObject write: defaultValue using: self ].
	^ defaultValue