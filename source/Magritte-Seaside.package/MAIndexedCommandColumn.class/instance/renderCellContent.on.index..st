rendering
renderCellContent: anObject on: html index: anInteger
	self commands
		do: [ :each |
			html anchor
				callback: [ each key valueWithArguments: (Array
					with: anObject
					with: anInteger) ];
				with: each value ]
		separatedBy: [ html space ]