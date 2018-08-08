visiting
expandDescription: aDescription for: aValue
	aValue magritteDescription do: [ :each |
		| val |
		val := aValue readUsing: each.
		each
			addToAccessor: aDescription accessor;
			priority: aDescription priority + (each priority / 1000).
		aDescription groupExpandOnLabel
			ifTrue: [ each group: aDescription label ]
			ifFalse: [ each group: aDescription group ].
		self addToBuildedDescription: each for: val ]