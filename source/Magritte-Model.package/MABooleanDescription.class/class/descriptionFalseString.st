accessing-descriptions
descriptionFalseString
	<magritte>
	^ MAStringDescription new
		accessor: #falseString;
		default: self defaultFalseString;
		label: 'False String';
		priority: 410;
		yourself