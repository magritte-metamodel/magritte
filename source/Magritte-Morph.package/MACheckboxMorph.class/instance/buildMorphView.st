private
buildMorphView
	^ Smalltalk ui theme
		newCheckboxIn: nil
		for: self
		getSelected: #selected
		setSelected: #selected:
		getEnabled: #enabled
		label: ''
		help: self magritteDescription comment