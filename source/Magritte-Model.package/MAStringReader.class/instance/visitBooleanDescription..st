visiting-description
visitBooleanDescription: aDescription
	(self isTrueUsing: aDescription)
			ifTrue: [ ^ self object: true ].
	(self isFalseUsing: aDescription)
			ifTrue: [ ^ self object: false ].
	MAReadError signal