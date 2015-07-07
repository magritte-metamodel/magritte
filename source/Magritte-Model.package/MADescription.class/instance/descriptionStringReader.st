acessing-magritte
descriptionStringReader
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #stringReader;
		label: 'String Reader';
		priority: 300;
		default: self class defaultStringReader;
		options: self class defaultStringReader withAllSubclasses;
		reference: MAClassDescription new;
		yourself