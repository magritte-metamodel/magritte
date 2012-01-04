private
buildMorphLabel
	^ self stringMorph
		contents: self description label , ':';
		width: 100;
		yourself