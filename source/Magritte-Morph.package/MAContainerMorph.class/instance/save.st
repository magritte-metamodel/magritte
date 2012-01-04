actions
save
	[ self validate ]
		on: MAValidationError
		do: [ :err | ^ self inform: err greaseString ].
	self commit; answer: self model