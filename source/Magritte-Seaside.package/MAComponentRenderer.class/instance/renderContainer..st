rendering
renderContainer: aDescription
	self visitAll: (aDescription select: [ :each |
		each isVisible
			and: [ each componentClass notNil ] ])