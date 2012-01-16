private
buildCommands
	commands := MACommandColumn new setReport: self report.
	self description isDefinitive ifFalse: [
		commands
			addCommandOn: self selector: #edit: text: 'edit';
			addCommandOn: self selector: #remove: text: 'remove' ].
	self description isOrdered ifTrue: [
		commands
			addCommandOn: self selector: #up: text: 'up';
			addCommandOn: self selector: #down: text: 'down' ].
	^ commands