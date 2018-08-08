private-building
addSelectListTo: aMorph

	| list |
	self classes ifEmpty: [ ^ self ].
	list := self rectangleMorph
		listDirection: #leftToRight;
		yourself.
	self classes size > 1 ifTrue: [ list addMorphBack: self buildClassChooser ].
	list addMorphBack: self buildSelectButton.
	aMorph addMorphBack: list