private-building
buildMorphViewOn: aMorph

	aMorph
		layoutInset: 1 @ 1;
		listDirection: #leftToRight;
		addMorphBack: self buildMorphLabel;
		addMorphBack: self buildMorphView.
	self magritteDescription hasComment
		ifTrue: [ aMorph setBalloonText: self magritteDescription comment ].
	self magritteDescription isRequired
		ifTrue: [ aMorph addMorphBack: self buildMorphRequired ]