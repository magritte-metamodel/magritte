private
buildMorphEditor

	| editor |
	editor := self rectangleMorph.
	editor addMorphBack: self buildMorphView.
	self magritteDescription isDefinitive
		ifFalse: [ self addSelectListTo: editor ].
	^ editor.