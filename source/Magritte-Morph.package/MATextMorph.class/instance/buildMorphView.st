private
buildMorphView
	^ Smalltalk ui theme
		newTextEntryIn: nil
		for: self
		get: #string
		set: #string:
		class: String
		getEnabled: #enabled
		help: self magritteDescription comment