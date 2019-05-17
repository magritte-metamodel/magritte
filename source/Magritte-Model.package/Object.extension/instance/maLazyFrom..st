*Magritte-Model
maLazyFrom: description
	"Return the current value of a field as specified by its description
		- NB: Only works with a selector accessor with matching inst var name e.g. (readSelector = instVarName = #myField). It could be extended to other cases if the need arises.
		- The default value is not cached. If necessary, another variant could be added to do that.

	Usage: 
		MyDomainObject>>#getter
			^ self maLazyFrom: self descriptionName
		
		MyDomainObject>>#descriptionName
			^ MAStringDescription new
					accessor: #name;
					default: 'Alan';
					yourself"

	| currentValue |
	currentValue := self instVarNamed: description accessor readSelector.
	^ currentValue ifNil: [ description default ].