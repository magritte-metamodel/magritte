*Magritte-Model
maLazyFrom: description
	"Return the current value of a field as specified by its description

	Usage: 
		MyDomainObject>>#getter
			^ self maLazyFrom: self descriptionName
		
		MyDomainObject>>#descriptionName
			^ MAStringDescription new
					accessor: #name;
					default: 'Alan';
					yourself"

	| currentValue defaultValue |
	currentValue := self readUsing: description.
	currentValue ifNotNil: [ ^ currentValue ].
	defaultValue := description default.
	self write: defaultValue using: description.
	^ defaultValue