private
buildCommands
	commands := MAIndexedCommandColumn new
				setReport: self report.

	self description isDefinitive
		ifFalse: [ commands
					addCommandOn: self selector: #edit:index: text: 'Edit';
					addCommandOn: self selector: #remove:index: text: 'Remove'].
	"not yet implemented
	self description isOrdered
		ifTrue: [ commands
					addCommandOn: self selector: #up:index:;
					addCommandOn: self selector: #down:index: ]. "

	^ commands