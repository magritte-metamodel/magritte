private
buildButton: aSymbol
	^ Smalltalk ui theme builder
		newButtonFor: self
		action: aSymbol
		label: aSymbol capitalized
		help: ''