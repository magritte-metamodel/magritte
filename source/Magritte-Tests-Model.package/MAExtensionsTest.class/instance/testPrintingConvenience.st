tests-string
testPrintingConvenience

	| result table |
	table := {
		{ MAStringDescription new
				accessor: #asString;
				yourself.
			self asString }.
		{ MAElementDescription new
				accessor: (MAPluggableAccessor new readBlock: [ :obj | nil ]);
				yourself.
			'' } }.
	
	table do: [ :data | 
		| description expected |
		description := data first.
		expected := data second.
		result := String streamContents: [ :str | str maPrint: description for: self ].

		self assert: result equals: expected ].