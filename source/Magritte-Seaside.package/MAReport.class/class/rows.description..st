instance creation
rows: aCollection description: aDescription
	| report |
	report := self rows: aCollection.
	aDescription asContainer do: [ :each |
		report addColumnDescription: each ].
	^ report