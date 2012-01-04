private
buildMorphView
	| result |
	result := self rectangleMorph
		setBalloonText: self description comment;
		listDirection: #topToBottom;
		cellInset: 3;
		yourself.
	self children do: [ :each |
		result addMorphBack: each morph ].
	^ result