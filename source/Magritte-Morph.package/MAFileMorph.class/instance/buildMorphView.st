private-building
buildMorphView

	| button |
	rectangleMorph := self rectangleMorph
		listDirection: #leftToRight;
		yourself.
	button := self buttonMorph: #choose.
	button
		hResizing: #shrinkWrap.
	rectangleMorph addMorphBack: button.
	self value ifNotNil: [ self displayCurrentValue ].
	^ rectangleMorph.