building
composeBrowserOn: browser
	browser
		row: #tree;
		row: #diff.

	browser transmit 
		to: #tree; 
 		andShow: [ :a |
			a fastTree 
				children: #children ].
	browser transmit to: #diff; from: #tree; andShow: [ :a | 
		a diff
			display: [ :op | op diffStrings ] ]