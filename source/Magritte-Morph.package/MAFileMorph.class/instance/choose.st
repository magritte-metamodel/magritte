actions
choose
	| file |
	file := self
		choose: 'Choose ', self magritteDescription label
		in: self magritteDescription defaultDirectory. 
	file ifNil: [ ^ self ].
	self value: file.
	self displayCurrentValue.