private
buildMorph
	| result |
	result := self rectangleMorph
		layoutInset: 1 @ 1;
		listDirection: #leftToRight;
		addMorphBack: self buildMorphLabel;
		addMorphBack: super buildMorph;
		yourself.
	self magritteDescription hasComment
		ifTrue: [ result setBalloonText: self magritteDescription comment ].
	self magritteDescription isRequired
		ifTrue: [ result addMorphBack: self buildMorphRequired ].
	^ result