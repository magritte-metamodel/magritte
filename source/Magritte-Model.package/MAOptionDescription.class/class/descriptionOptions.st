accessing-description
descriptionOptions
	<magritte>
	^ MAMemoDescription new
		accessor: #optionsTextual;
		label: 'Options';
		priority: 410;
		default: self defaultOptions;
		yourself