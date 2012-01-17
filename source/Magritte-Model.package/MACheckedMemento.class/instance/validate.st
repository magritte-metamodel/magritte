actions
validate
	self hasConflict
		ifFalse: [ ^ super validate ].
	self reset.
	MAConflictError
		description: self magritteDescription
		signal: self magritteDescription conflictErrorMessage