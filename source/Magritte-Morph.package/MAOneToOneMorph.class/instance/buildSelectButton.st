private
buildSelectButton
	^ Smalltalk ui theme builder
		newButtonFor: self
		action: #create
		label: 'Create'
		help: ''