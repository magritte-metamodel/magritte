private
buildCommandColumn
	|retVal|
	retVal := MAIndexedCommandColumn new
				setReport: self report.

	self magritteDescription isDefinitive
		ifFalse: [ retVal
					addCommandOn: self selector: #edit:index: text: 'Edit';
					addCommandOn: self selector: #remove:index: text: 'Remove'].
	"not yet implemented
	self description isOrdered
		ifTrue: [ commands
					addCommandOn: self selector: #up:index:;
					addCommandOn: self selector: #down:index: ]. "

	^ retVal