*Magritte-Model
isSameAs: rhs using: valuableDescription
	"Use #isSameAs: unless you need to cache the description for efficiency.
	CAUTION: this may not work if the description depends on the instance e.g. uses `self` in a block
	(See comment below for more details)"
	^ valuableDescription value allSatisfy: [ :desc |
			| myVal rhsVal |
			myVal := desc read: self.
			rhsVal := desc read: rhs.
			({ nil. desc default } includesAll: { myVal. rhsVal })
				ifTrue: [ true ]
				ifFalse: [ myVal = rhsVal ] ].
	"Motivation: Profiling on a large dataset (120,000 records) showed about 66% of processing time was spent (re)building the description"