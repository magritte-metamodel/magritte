*Magritte-Model
maLazyFromDescriptionOf: accessorSymbol
	"Return the current value of a field, or the default specified in the description

	Usage: 
		MyDomainObject>>#getter
			^ self maLazyFromDescriptionOf: #getter
		
		MyDomainObject>>#getterDescription
			^ MAElementDescription new
					accessor: #getter;
					default: 1;
					yourself"
	| currentValue defaultValue description |
	currentValue := self instVarNamed: accessorSymbol.
	currentValue ifNotNil: [ ^ currentValue ].
	description := self magritteDescription children detect: [ :desc | desc isMessage: accessorSymbol ].
	defaultValue := description default.
	self instVarNamed: accessorSymbol put: defaultValue.
	^ defaultValue