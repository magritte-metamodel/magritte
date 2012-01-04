actions
validate
	self hasConflict
		ifFalse: [ ^ super validate ].
	self reset.
	MAConflictError
		description: self description
		signal: self description conflictErrorMessage