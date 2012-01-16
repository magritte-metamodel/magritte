rendering
renderContentOn: html
	html form: [
		self renderChildrenOn: html. "One of the children supplies input for the form"
		self renderButtonsOn: html ]