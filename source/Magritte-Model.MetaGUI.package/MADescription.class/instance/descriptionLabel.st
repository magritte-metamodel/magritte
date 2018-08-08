acessing-magritte
descriptionLabel
	<magritteDescription>
	^ MAStringDescription new
		accessor: #label;
		label: 'Label';
		priority: 100;
		default: self class defaultLabel;
		yourself