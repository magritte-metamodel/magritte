accessing
child1
	^ child1 ifNil: 
		[ child1 := MAStringDescription new
			accessor: #child1;
			label: 'child1';
			priority: 1;
			yourself ]