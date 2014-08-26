private
buildCommandColumn
	|retVal|
	retVal := MACommandColumn new setReport: self report.
	self magritteDescription isDefinitive ifFalse: [
		retVal
			addCommandOn: self selector: #edit: text: 'edit';
			addCommandOn: self selector: #remove: text: 'remove' ].
	self magritteDescription isOrdered ifTrue: [
		retVal
			addCommandOn: self selector: #up: text: 'up';
			addCommandOn: self selector: #down: text: 'down' ].
	^ retVal