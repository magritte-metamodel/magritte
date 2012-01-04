decorating
addButtons: anArray
	morph := self rectangleMorph
		addMorphBack: self morph;
		addMorphBack: (self barMorph: anArray);
		yourself