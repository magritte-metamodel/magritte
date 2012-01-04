accessing-description
descriptionStringReader
	<magritte>
	^ MASingleOptionDescription new
		accessor: #stringReader;
		label: 'String Reader';
		priority: 300;
		default: self defaultStringReader;
		options: [ self defaultStringReader withAllSubclasses ] magritteDynamicObject;
		reference: MAClassDescription new;
		yourself