acessing-magritte
descriptionTrueString
	<magritteDescription>
	^ MAStringDescription new
		accessor: #trueString;
		default: self class defaultTrueString;
		label: 'True String';
		priority: 400;
		yourself