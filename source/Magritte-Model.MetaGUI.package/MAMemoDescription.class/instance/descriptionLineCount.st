acessing-magritte
descriptionLineCount
	<magritteDescription>
	^ MANumberDescription new
		accessor: #lineCount;
		label: 'Number of Lines';
		priority: 400;
		default: self class defaultLineCount;
		beInteger;
		min: 1;
		yourself