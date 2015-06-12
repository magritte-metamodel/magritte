accessing
reference
	^ reference ifNil: [ reference := self class defaultReference ]