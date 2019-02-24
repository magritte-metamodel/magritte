private-validating
validateCounts: anObject 
	(anObject rowCount ~= self rowCount or: [ anObject columnCount ~= self columnCount ])
		ifTrue: [ MAKindError description: self signal: self kindErrorMessage ].