descriptions
descriptionTitle
	<magritteDescription>
	
	^ MASingleOptionDescription new
			options: #( 'Mr.' 'Mrs.' 'Ms.' 'Miss.' );
			accessor: #title;
			label: 'Title';
			priority: 10;
			yourself