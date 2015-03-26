accessing
morph
	morph ifNotNil: [ ^ morph ].
	morph := self rectangleMorph
		setBalloonText: self magritteDescription comment;
		cellInset: 3;
		yourself.
	self visit: self magritteDescription.
	^ morph