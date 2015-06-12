acessing-magritte
descriptionDefault
	<magritteDescription>
	^ self class isAbstract
		ifFalse: [ 
			self class new
				accessor: #default;
				label: 'Default';
				priority: 130;
				default: self class defaultDefault;
				yourself ]