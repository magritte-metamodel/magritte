acessing-magritte
descriptionPriority
	<magritteDescription>
	^ MANumberDescription new
		accessor: #priority;
		label: 'Priority';
		priority: 130;
		default: self class defaultPriority;
		beRequired;
		yourself