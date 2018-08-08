accessing
child3
	^ child3 ifNil: 
		[ child3 := MAStringDescription new
			accessor: #child3;
			label: 'child3';
			priority: 3;
			yourself ]