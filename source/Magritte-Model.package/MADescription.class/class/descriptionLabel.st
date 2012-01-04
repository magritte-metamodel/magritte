accessing-description
descriptionLabel
	<magritte>
	^ MAStringDescription new
		accessor: #label;
		label: 'Label';
		priority: 100;
		default: self defaultLabel;
		yourself