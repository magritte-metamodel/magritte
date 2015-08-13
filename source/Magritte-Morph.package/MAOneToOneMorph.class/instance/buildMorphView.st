as yet unclassified
buildMorphView

	| table |
	table := self rectangleMorph
		listDirection: #topToBottom;
		yourself.
	self value
		ifNotNil: [ MAElementRow addMorphFor: self value of: self to: table ]
		ifNil: [ self addSelectListTo: table ].
	^ table.