private-building
buildMorphView
	| model |
	model := DateModel new
		date: self value;
		whenDateChanged: [ :newDate | self value: newDate ];
		yourself.
	^ model buildWithSpec
			yourself.