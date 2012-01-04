private
buildMorph
	| result |
	result := self rectangleMorph
		layoutInset: 1 @ 1;
		listDirection: #leftToRight;
		addMorphBack: self buildMorphLabel;
		addMorphBack: super buildMorph;
		yourself.
	self description hasComment
		ifTrue: [ result setBalloonText: self description comment ].
	self description isRequired
		ifTrue: [ result addMorphBack: self buildMorphRequired ].
	^ result