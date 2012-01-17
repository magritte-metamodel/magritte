private
buildMorphView
	| result |
	result := self rectangleMorph
		setBalloonText: self magritteDescription comment;
		listDirection: #topToBottom;
		cellInset: 3;
		yourself.
	self children do: [ :each |
		result addMorphBack: each morph ].
	^ result