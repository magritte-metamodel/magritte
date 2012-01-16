accessing-readonly
cache
	"Return the cached rows of the receiver, these rows are filtered and sorted."

	cache isNil ifTrue: [
		self cache: (self
			sortRows: (self
				filterRows: self
					rows asArray)) ].
	^ cache