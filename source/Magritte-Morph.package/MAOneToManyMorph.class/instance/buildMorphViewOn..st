private
buildMorphViewOn: aMorph

	super buildMorphViewOn: aMorph.
	aMorph listDirection: #topToBottom.
	self magritteDescription isDefinitive
		ifFalse: [ self addSelectListTo: aMorph ]