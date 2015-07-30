private-building
buildMorphView
	| model |
	model := DateModel new
		displayBlock: [ :e | description displayStringFor: e ];
		date: self value;
		whenDateChanged: [ :newDate | self value: newDate ];
		yourself.
	^ model buildWithSpec
			yourself.