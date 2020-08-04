private
rowOfText: aString
	| text cell |
	text := PRText content: aString.
	cell := PRTableCell new
		add: text;
		yourself.
	^ PRTableRow new
		add: cell;
		yourself