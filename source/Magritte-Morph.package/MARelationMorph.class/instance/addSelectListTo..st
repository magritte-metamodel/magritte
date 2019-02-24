private-building
addSelectListTo: aMorph

	self classes ifEmpty: [ ^ self ].
	aMorph addMorphBack: self buildSelectList