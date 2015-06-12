acessing-magritte
descriptionOptions
	<magritteDescription>
	^ MAMemoDescription new
		accessor: #optionsTextual;
		label: 'Options';
		priority: 410;
		default: self class defaultOptions;
		yourself