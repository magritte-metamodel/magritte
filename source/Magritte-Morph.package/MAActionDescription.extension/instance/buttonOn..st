*magritte-morph
buttonOn: anObject
	^ UITheme current builder
		newButtonFor: self
		getState: nil
		action: #performOn:
		arguments: { anObject }
		getEnabled: #isEnabled
		label: self label
		help: comment