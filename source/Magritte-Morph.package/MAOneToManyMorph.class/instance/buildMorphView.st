private
buildMorphView

	| table |
	table := self rectangleMorph
		listDirection: #topToBottom;
		yourself.
	self value do: [ :e | MAElementRow addMorphFor: e of: self to: table ].
	self magritteDescription isDefinitive
		ifFalse: [ self addSelectListTo: table ].
	^ table.