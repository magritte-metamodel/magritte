private
buildReport
	^ (MAReport rows: self magritteDescription children description: MAElementDescription magritteDescription)
		addColumn: (MAColumn new
			accessor: #( magritteDescription label );
			label: 'Kind';
			yourself);
		addColumn: (MACommandColumn new
			addCommandOn: self selector: #editDescription: text: 'edit';
			addCommandOn: self selector: #moveUp: text: 'up';
			addCommandOn: self selector: #moveDown: text: 'down';
			addCommandOn: self selector: #removeDescription: text: 'remove';
			yourself);
		yourself