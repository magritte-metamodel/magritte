accessing
commands
	^ commands ifNil: [ commands := self buildCommands ]