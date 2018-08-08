rendering
renderCellFormContent: anObject on: html
	self commands
		do: [ :each |
			html submitButton
				callback: [ each key value: anObject ];
				text: each value ]
		separatedBy: [ html space ]