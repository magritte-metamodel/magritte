instance creation
addMorphFor: anObject of: aDescriptionMorph to: aMorph
	| instance |
	instance := self for: anObject of: aDescriptionMorph.
	aMorph addMorphBack: instance.