private
buildSelectButton
	^ Smalltalk ui theme builder
		newButtonFor: self
		action: #add
		label: 'Add'
		help: ''