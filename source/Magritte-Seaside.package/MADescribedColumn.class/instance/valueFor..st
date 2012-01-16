actions
valueFor: aRow
	^ (super valueFor: aRow) ifNil: [ self description default ]