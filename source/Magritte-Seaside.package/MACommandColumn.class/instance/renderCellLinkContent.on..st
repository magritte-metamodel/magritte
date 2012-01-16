rendering
renderCellLinkContent: anObject on: html
	self commands
		do: [ :each |
			html anchor
				callback: [ each key value: anObject ];
				with: each value ]
		separatedBy: [ html space ]