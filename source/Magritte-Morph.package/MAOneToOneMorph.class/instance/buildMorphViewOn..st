private
buildMorphViewOn: aMorph
	self value isNil
		ifTrue: [ self addSelectListTo: aMorph ]
		ifFalse: [ self buildMorphViewOn: aMorph; renderButtonsOn: aMorph ]