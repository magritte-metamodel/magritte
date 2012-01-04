visiting-description
visitNumberDescription: aDescription
	| contents |
	contents := self contents.
	contents isEmpty
		ifTrue: [ MAReadError signal ].
	(contents occurrencesOf: $-) > 1
		ifTrue: [ MAReadError signal ].
	(contents indexOf: $-) > 1
		ifTrue: [ MAReadError signal ].
	(contents occurrencesOf: $.) > 1
		ifTrue: [ MAReadError signal ].
	(contents allSatisfy: [ :each | '+-0123456789.eE' includes: each ])
		ifFalse: [ MAReadError signal ].
	super visitNumberDescription: aDescription