private
buildMorphViewOn: aMorph

	| toolbar |
	self magritteDescription do: [ :each | self visit: each ].
	toolbar := self rectangleMorph
		listDirection: #leftToRight;
		cellInset: 4@0;
		layoutInset: 4@4;
		yourself.
	self model magritteActions do: [ :e | toolbar addMorphBack: e ].
	aMorph addMorphBack: toolbar.
		