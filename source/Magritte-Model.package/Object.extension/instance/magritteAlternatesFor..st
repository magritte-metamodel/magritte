*Magritte-Model
magritteAlternatesFor: aDescriptionSelector
	| altDescriptionMethods relevantDescMeths |
	altDescriptionMethods := Pragma
		allNamed: #magritteAltFor:
		from: self class
		to: Object.
	relevantDescMeths := altDescriptionMethods select: [ :p | p arguments first = aDescriptionSelector ].
	^ relevantDescMeths collect: [ :m | self perform: m method selector ]