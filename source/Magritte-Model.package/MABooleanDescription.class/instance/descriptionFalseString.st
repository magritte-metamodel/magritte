acessing-magritte
descriptionFalseString
	<magritteDescription>
	^ MAStringDescription new
		accessor: #falseString;
		default: self class defaultFalseString;
		label: 'False String';
		priority: 410;
		yourself