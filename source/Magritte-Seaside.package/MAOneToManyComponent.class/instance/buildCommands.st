private
buildCommands
	commands := MACommandColumn new setReport: self report.
	self magritteDescription isDefinitive ifFalse: [
		commands
			addCommandOn: self selector: #edit: text: 'edit';
			addCommandOn: self selector: #remove: text: 'remove' ].
	self magritteDescription isOrdered ifTrue: [
		commands
			addCommandOn: self selector: #up: text: 'up';
			addCommandOn: self selector: #down: text: 'down' ].
	^ commands