rendering
renderViewerOn: html
	(self string findTokens: Character cr)
		do: [ :each | html render: each ]
		separatedBy: [ html break ]