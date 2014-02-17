accessing
defaultKind
	self classes ifEmpty: [ ^super defaultKind ].
	^self commonClass