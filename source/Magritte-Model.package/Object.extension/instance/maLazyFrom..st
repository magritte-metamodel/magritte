*Magritte-Model
maLazyFrom: description
	"Return the current value of a field as specified by its description
		- NB: Only works with a selector accessor with matching inst var name e.g. (readSelector = instVarName = #myField). It could be extended to other cases if the need arises.
		- The default value is cached if the description's #shouldCacheDefault property is true. An example when caching is necessary is for to-many relations because the user may modify the collection, which will then be thrown away if not cached

	Usage: 
		MyDomainObject>>#getter
			^ self maLazyFrom: self descriptionName
		
		MyDomainObject>>#descriptionName
			^ MAStringDescription new
					accessor: #name;
					default: 'Alan';
					yourself"

	| currentValue defaultValue |
	currentValue := self instVarNamed: description accessor readSelector.
	currentValue ifNotNil: [ ^ currentValue ].
	defaultValue := description default.
	description shouldCacheDefault ifTrue: [ self write: defaultValue using: description ].
	^ defaultValue.