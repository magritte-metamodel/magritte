accessing-description
descriptionPriority
	<magritte>
	^ MANumberDescription new
		accessor: #priority;
		label: 'Priority';
		priority: 130;
		default: self defaultPriority;
		beRequired;
		yourself