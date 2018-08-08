actions
valueFor: aRow
	^ (super valueFor: aRow) ifNil: [ self magritteDescription default ]