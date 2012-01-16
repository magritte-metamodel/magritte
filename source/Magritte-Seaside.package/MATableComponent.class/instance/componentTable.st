accessing
componentTable
	^ componentTable ifNil: [ componentTable := self buildComponentTable ]