accessing
morph
	^ morph ifNil: [ morph := self buildMorph ]