actions
addButtons: aCollection
	aCollection do: [ :each |
		each isVariableBinding
			ifFalse: [ self addButton: each ]
			ifTrue: [ self addButton: each key label: each value ] ]