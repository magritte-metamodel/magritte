private-building
buildMorphView
	| model |
	model := DateModel new
		date: self value;
		displayBlock: [ :e | description displayStringFor: e ];
		whenDateChanged: [ :newDate | self value: newDate ];
		yourself.
	^ model buildWithSpec
			yourself.