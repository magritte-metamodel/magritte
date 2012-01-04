private
buildMorphEditor
	^ UITheme current 
		newCheckboxIn: nil
		for: self
		getSelected: #selected
		setSelected: #selected:
		getEnabled: #enabled
		label: self description label 
		help: self description comment