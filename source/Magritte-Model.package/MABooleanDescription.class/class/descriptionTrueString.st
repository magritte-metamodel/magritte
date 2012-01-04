accessing-descriptions
descriptionTrueString
	<magritte>
	^ MAStringDescription new
		accessor: #trueString;
		default: self defaultTrueString;
		label: 'True String';
		priority: 400;
		yourself