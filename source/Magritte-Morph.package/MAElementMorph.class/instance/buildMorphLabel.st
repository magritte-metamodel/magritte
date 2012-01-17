private
buildMorphLabel
	^ self stringMorph
		contents: self magritteDescription label , ':';
		width: 100;
		yourself