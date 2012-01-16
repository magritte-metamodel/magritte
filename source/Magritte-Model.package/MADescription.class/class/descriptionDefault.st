acessing-magritte
descriptionDefault
	<magritteDescription>
	^ self isAbstract
		ifFalse: [ 
			self new
				accessor: #default;
				label: 'Default';
				priority: 130;
				default: self defaultDefault;
				yourself ]