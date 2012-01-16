acessing-magritte
descriptionStringReader
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #stringReader;
		label: 'String Reader';
		priority: 300;
		default: self class defaultStringReader;
		options: [ self class defaultStringReader withAllSubclasses ] magritteDynamicObject;
		reference: MAClassDescription new;
		yourself