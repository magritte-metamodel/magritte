accessing
child2
	^ child2 ifNil: 
		[ child2 := MAStringDescription new
			accessor: #child2;
			label: 'child2';
			priority: 2;
			yourself ]