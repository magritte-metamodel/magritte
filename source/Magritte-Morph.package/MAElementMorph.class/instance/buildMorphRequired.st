private
buildMorphRequired
	^ self stringMorph
		contents: ' *';
		color: Color red;
		yourself