*magritte-seaside-description
descriptionReportColumnClass
	<magritteDescription>
	^ MASingleOptionDescription new
		accessor: #reportColumnClass;
		label: 'Report Column Class';
		priority: 1010;
		reference: MAClassDescription new;
		options: self defaultReportColumnClasses;
		default: self defaultReportColumnClass;
		yourself