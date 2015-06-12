visiting-description
visitContainer: aDescription
	aDescription do: [ :each |
		each isVisible ifTrue: [
			each stringWriter
				write: (self object readUsing: each)
				description: each to: stream.
			^ self ] ]