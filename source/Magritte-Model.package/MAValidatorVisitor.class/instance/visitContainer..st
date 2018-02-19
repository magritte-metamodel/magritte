visiting-descriptions
visitContainer: aDescription
	
	super visitContainer: aDescription.
	self object ifNotNil: [
		aDescription do: [ :description |
			self
				use: (self object readUsing: description)
				during: [ self visit: description ] ] ]