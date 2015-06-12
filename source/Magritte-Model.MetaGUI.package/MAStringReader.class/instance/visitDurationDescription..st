visiting-description
visitDurationDescription: aDescription
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
	(contents allSatisfy: [:each | '-0123456789.:' includes: each])
		ifFalse: [ MAReadError signal ].
	super visitDurationDescription: aDescription