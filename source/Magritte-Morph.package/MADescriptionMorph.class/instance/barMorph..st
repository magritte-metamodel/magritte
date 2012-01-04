prototypes
barMorph: anArray
	| bar |
	bar := self rectangleMorph
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		listDirection: #leftToRight;
		listCentering: #center;
		wrapCentering: #bottomRight;
		cellInset: self defaultSpacerSize;
		yourself.
	anArray do: [ :selector |
		bar addMorphBack: (self buttonMorph: selector) ].
	^ bar