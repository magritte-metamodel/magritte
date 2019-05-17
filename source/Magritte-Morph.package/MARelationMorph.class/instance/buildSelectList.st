private-building
buildSelectList

	| list |
	list := self rectangleMorph
		listDirection: #leftToRight;
		yourself.
	self classes size > 1 ifTrue: [ list addMorphBack: self buildClassChooser ].
	^ list 
			addMorphBack: self buildSelectButton;
			yourself.