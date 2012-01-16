columns
addColumn: aColumn
	columns := columns copyWith: aColumn.
	^ aColumn setReport: self; yourself