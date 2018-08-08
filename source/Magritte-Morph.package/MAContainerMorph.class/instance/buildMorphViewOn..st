private
buildMorphViewOn: aMorph

	| toolbar |
	aMorph
		listDirection: #topToBottom;
		cellInset: 3.
	self children do: [ :each |
		aMorph addMorphBack: each morph ].
	toolbar := self rectangleMorph
		listDirection: #leftToRight;
		cellInset: 4@0;
		layoutInset: 4@4;
		yourself.
	self model magritteActionButtons do: [ :e | toolbar addMorphBack: e ].
	aMorph addMorphBack: toolbar.
		