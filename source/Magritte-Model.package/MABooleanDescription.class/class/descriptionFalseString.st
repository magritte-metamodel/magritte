acessing-magritte
descriptionFalseString
	<magritteDescription>
	^ MAStringDescription new
		accessor: #falseString;
		default: self defaultFalseString;
		label: 'False String';
		priority: 410;
		yourself